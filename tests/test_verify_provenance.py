from __future__ import annotations

import json
import shutil
import tempfile
import unittest
from pathlib import Path

from scripts.verify_provenance import ROOT, client_digest, verify


class VerifyProvenanceTests(unittest.TestCase):
    def copy_published_tree(self) -> Path:
        directory = tempfile.TemporaryDirectory()
        self.addCleanup(directory.cleanup)
        copy = Path(directory.name)
        for name in ("Package.swift", "FitAppClientSwift.podspec", "PROVENANCE.json"):
            shutil.copy(ROOT / name, copy / name)
        shutil.copytree(ROOT / "FitAppClientSwift", copy / "FitAppClientSwift")
        return copy

    def test_published_tree_matches_the_upstream_digest(self) -> None:
        # The reviewed upstream manifest is the release-specific expectation.
        # Pinning a second release digest here makes valid publications fail.
        provenance = json.loads((ROOT / "PROVENANCE.json").read_text(encoding="utf-8"))
        self.assertEqual(verify(), provenance["swiftClientSha256"])

    def test_digest_matches_a_release_independent_known_vector(self) -> None:
        # Fixed independently from any release: guards sorted prefixed paths,
        # NUL separators and upstream whitespace normalization. Create files in
        # reverse path order so filesystem iteration cannot define the digest.
        files = {
            "Package.swift": "// swift-tools-version:5.1 \t\n\n",
            "FitAppClientSwift/Classes/OpenAPIs/ContractVersion.swift":
                'public let contractVersion = "1.2.3"\t\n\n\n',
            "FitAppClientSwift.podspec": "Pod::Spec.new do |s| \t\nend\t\n\n",
        }
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            for relative, content in files.items():
                path = root / relative
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(content, encoding="utf-8")
            actual = client_digest(root)
        self.assertEqual(
            actual,
            "3515ab5e010cc7ea1e188fbeff9bd2c70d5be10e50f271d9156dca6af938bb08",
        )

    def test_any_generated_source_change_is_rejected(self) -> None:
        for relative in (
            "Package.swift",
            "FitAppClientSwift.podspec",
            "FitAppClientSwift/Classes/OpenAPIs/ContractVersion.swift",
        ):
            with self.subTest(path=relative):
                copy = self.copy_published_tree()
                source = copy / relative
                source.write_text(
                    source.read_text(encoding="utf-8") + "\n// mutation probe\n",
                    encoding="utf-8",
                )
                with self.assertRaisesRegex(ValueError, "digest mismatch"):
                    verify(copy)

    def test_missing_generated_source_is_rejected(self) -> None:
        copy = self.copy_published_tree()
        (copy / "FitAppClientSwift/Classes/OpenAPIs/ContractVersion.swift").unlink()
        with self.assertRaisesRegex(ValueError, "digest mismatch"):
            verify(copy)

    def test_extra_generated_source_is_rejected(self) -> None:
        copy = self.copy_published_tree()
        (copy / "FitAppClientSwift/Classes/Unexpected.swift").write_text(
            "// unexpected source\n", encoding="utf-8"
        )
        with self.assertRaisesRegex(ValueError, "digest mismatch"):
            verify(copy)

    def test_changed_manifest_digest_is_rejected(self) -> None:
        copy = self.copy_published_tree()
        path = copy / "PROVENANCE.json"
        provenance = json.loads(path.read_text(encoding="utf-8"))
        expected = provenance["swiftClientSha256"]
        for digest in ("0" * 64, expected[:-1]):
            with self.subTest(digest=digest):
                provenance["swiftClientSha256"] = digest
                path.write_text(json.dumps(provenance), encoding="utf-8")
                with self.assertRaisesRegex(ValueError, "digest mismatch"):
                    verify(copy)

    def test_noncanonical_source_commit_is_rejected(self) -> None:
        copy = self.copy_published_tree()
        path = copy / "PROVENANCE.json"
        provenance = json.loads(path.read_text(encoding="utf-8"))
        provenance["sourceCommit"] = "7d1b89f0"
        path.write_text(json.dumps(provenance), encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "full lowercase Git SHA"):
            verify(copy)

    def test_noncanonical_source_repository_is_rejected(self) -> None:
        copy = self.copy_published_tree()
        path = copy / "PROVENANCE.json"
        provenance = json.loads(path.read_text(encoding="utf-8"))
        provenance["sourceRepository"] = "https://github.com/example/contracts"
        path.write_text(json.dumps(provenance), encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "canonical contracts repository"):
            verify(copy)

    def test_contract_version_mismatch_is_rejected(self) -> None:
        copy = self.copy_published_tree()
        path = copy / "PROVENANCE.json"
        provenance = json.loads(path.read_text(encoding="utf-8"))
        provenance["contractVersion"] = "999.0.0"
        path.write_text(json.dumps(provenance), encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "ContractVersion.swift does not match"):
            verify(copy)


if __name__ == "__main__":
    unittest.main()

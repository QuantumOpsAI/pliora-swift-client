from __future__ import annotations

import json
import shutil
import tempfile
import unittest
from pathlib import Path

from scripts.verify_provenance import ROOT, verify


class VerifyProvenanceTests(unittest.TestCase):
    def test_published_tree_matches_the_upstream_digest(self) -> None:
        self.assertEqual(
            verify(),
            "2d01572e092a4779a400fb8f682e967779a7d2cbfe80b15a5d3f2fae97c3635b",
        )

    def test_any_generated_source_change_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            copy = Path(directory)
            shutil.copy(ROOT / "Package.swift", copy / "Package.swift")
            shutil.copy(ROOT / "FitAppClientSwift.podspec", copy / "FitAppClientSwift.podspec")
            shutil.copy(ROOT / "PROVENANCE.json", copy / "PROVENANCE.json")
            shutil.copytree(ROOT / "FitAppClientSwift", copy / "FitAppClientSwift")

            contract_version = copy / "FitAppClientSwift/Classes/OpenAPIs/ContractVersion.swift"
            contract_version.write_text(
                contract_version.read_text(encoding="utf-8") + "\n// mutation probe\n",
                encoding="utf-8",
            )

            with self.assertRaisesRegex(ValueError, "digest mismatch"):
                verify(copy)

    def test_noncanonical_source_commit_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            copy = Path(directory)
            shutil.copy(ROOT / "Package.swift", copy / "Package.swift")
            shutil.copy(ROOT / "FitAppClientSwift.podspec", copy / "FitAppClientSwift.podspec")
            shutil.copy(ROOT / "PROVENANCE.json", copy / "PROVENANCE.json")
            shutil.copytree(ROOT / "FitAppClientSwift", copy / "FitAppClientSwift")

            provenance = copy / "PROVENANCE.json"
            provenance.write_text(
                provenance.read_text(encoding="utf-8").replace(
                    json.loads(provenance.read_text(encoding="utf-8"))["sourceCommit"], "7d1b89f0"
                ),
                encoding="utf-8",
            )

            with self.assertRaisesRegex(ValueError, "full lowercase Git SHA"):
                verify(copy)


if __name__ == "__main__":
    unittest.main()

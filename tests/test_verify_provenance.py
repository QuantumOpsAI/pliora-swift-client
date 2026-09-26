from __future__ import annotations

import shutil
import tempfile
import unittest
from pathlib import Path

from scripts.verify_provenance import ROOT, verify


class VerifyProvenanceTests(unittest.TestCase):
    def test_published_tree_matches_the_upstream_digest(self) -> None:
        self.assertEqual(
            verify(),
            "24b5fcb8dab96c09f94cd627ce16feaaa068f59e61dc1069535c0b3bef39abe6",
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


if __name__ == "__main__":
    unittest.main()

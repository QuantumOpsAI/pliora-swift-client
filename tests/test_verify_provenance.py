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
            "b7af6b8dfdf5b2be581553d6eb386ac2ff6b4f20d119776ccdfe0cdaa9ddb424",
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
                    "90ce702f78178761cf74a82fed6fd929445ceddf", "7d1b89f0"
                ),
                encoding="utf-8",
            )

            with self.assertRaisesRegex(ValueError, "full lowercase Git SHA"):
                verify(copy)


if __name__ == "__main__":
    unittest.main()

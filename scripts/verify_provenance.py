#!/usr/bin/env python3
"""Fail closed when the published Swift client differs from its source manifest."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
UPSTREAM_PREFIX = "generated/swift/"


def normalized_bytes(path: Path) -> bytes:
    text = path.read_text(encoding="utf-8")
    text = re.sub(r"[ \t]+$", "", text, flags=re.MULTILINE)
    text = re.sub(r"\n+\Z", "\n", text)
    return text.encode()


def client_files(root: Path = ROOT) -> list[Path]:
    sources = [
        path
        for path in (root / "FitAppClientSwift" / "Classes").rglob("*")
        if path.is_file()
    ]
    files = [root / "Package.swift", root / "FitAppClientSwift.podspec", *sources]
    return sorted(files, key=lambda path: path.relative_to(root).as_posix())


def client_digest(root: Path = ROOT) -> str:
    digest = hashlib.sha256()
    for path in client_files(root):
        relative = path.relative_to(root).as_posix()
        digest.update(f"{UPSTREAM_PREFIX}{relative}".encode())
        digest.update(b"\0")
        digest.update(normalized_bytes(path))
    return digest.hexdigest()


def verify(root: Path = ROOT) -> str:
    provenance = json.loads((root / "PROVENANCE.json").read_text(encoding="utf-8"))
    release_version = provenance["releaseVersion"]
    semver = r"(?:0|[1-9]\d*)(?:\.(?:0|[1-9]\d*)){2}(?:-[0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*)?"
    if not re.fullmatch(semver, release_version):
        raise ValueError("releaseVersion is not exact SemVer")

    source_commit = provenance["sourceCommit"]
    if not re.fullmatch(r"[0-9a-f]{40}", source_commit):
        raise ValueError("sourceCommit must be a full lowercase Git SHA")

    if provenance["sourceRepository"] != "https://github.com/QuantumOpsAI/pliora-contracts":
        raise ValueError("sourceRepository is not the canonical contracts repository")

    expected = provenance["swiftClientSha256"]
    actual = client_digest(root)
    if actual != expected:
        raise ValueError(f"Swift client digest mismatch: expected={expected} actual={actual}")

    contract_version = root / "FitAppClientSwift/Classes/OpenAPIs/ContractVersion.swift"
    if f'"{provenance["contractVersion"]}"' not in contract_version.read_text(encoding="utf-8"):
        raise ValueError("ContractVersion.swift does not match PROVENANCE.json")
    return actual


def main() -> int:
    try:
        actual = verify()
    except ValueError as error:
        raise SystemExit(str(error)) from error
    print(f"provenance verified: {actual}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import subprocess
import sys
import tarfile
import time

ENTRIES = """
index.html 404.html kagerou/overlay/index.html kagerou/config/index.html
mopimopi/index.html mopimopi2/index.html horizoverlay/index.html
canisminor/index.html faceroll/index.html ember/index.html amethyst/index.html
ikegami/index.html skyline/index.html skyline/sw.js zeffui/index.html
zeffui/settings.html SkillDisplay/index.html DeepDungeonOverlay/index.html
DeepDungeonOverlay/targetinfo/index.html klondike/index.html
ffxiv-glass-overlay/index.html Next-UI/index.html fonts/inter.css
assets/overlayplugin/common.min.js
""".split()
EXCLUDED = {".git", ".gitignore", ".github", "node_modules", ".cache", ".parcel-cache", ".angular", ".yarn"}
SCRIPT_SUFFIXES = {".js", ".mjs", ".cjs", ".css"}
MAP_LINE = rb"(?m)^[ \t]*(?://|/\*)[#@][ \t]*sourceMappingURL[ \t]*="
MAP_TAIL = re.compile(
    rb"(?:^[ \t]*//[#@][ \t]*sourceMappingURL[ \t]*=[^\r\n]*"
    rb"|/\*[#@][ \t]*sourceMappingURL[ \t]*=[^*\r\n]*\*/)[ \t\r\n]*\Z",
    re.MULTILINE,
)


def output(*command):
    return subprocess.check_output(command, text=True).strip()


def digest(path):
    with path.open("rb") as file:
        return hashlib.file_digest(file, "sha256").hexdigest()


def run(project, phase, *command):
    if phase == "install" and not Path("bun.lock").is_file():
        raise SystemExit(f"{project}: missing bun.lock")
    started = time.monotonic()
    status = subprocess.run(command).returncode
    seconds = round(time.monotonic() - started, 3)
    print(f"{project} {phase}: {seconds:.3f}s (exit {status})", flush=True)
    if report := os.getenv("BUILD_TIMINGS"):
        row = dict(project=project, phase=phase, seconds=seconds, exit=status)
        with open(report, "a") as file:
            file.write(json.dumps(row) + "\n")
    return status


def strip_maps(site):
    for path in site.rglob("*"):
        if path.is_symlink() or not path.is_file():
            continue
        if path.suffix.lower() == ".map":
            path.unlink()
        elif path.suffix in SCRIPT_SUFFIXES:
            original = data = path.read_bytes()
            while True:
                cleaned = MAP_TAIL.sub(b"", data)
                if cleaned == data:
                    break
                data = cleaned
            if re.search(MAP_LINE, data):
                raise SystemExit(f"unexpected sourcemap directive: {path}")
            if data != original:
                path.write_bytes(data)


def inventory(site):
    files = {}
    directories = []
    for path in sorted(site.rglob("*")):
        relative = path.relative_to(site)
        if EXCLUDED.intersection(relative.parts):
            continue
        if path.is_symlink():
            raise SystemExit(f"symbolic link in site: {relative}")
        if path.is_dir():
            directories.append(relative)
            continue
        if not path.is_file() or path.stat().st_nlink != 1:
            raise SystemExit(f"expected a regular unlinked file: {relative}")
        if path.suffix.lower() == ".map" or (
            path.suffix in SCRIPT_SUFFIXES
            and (re.search(MAP_LINE, data := path.read_bytes()) or MAP_TAIL.search(data))
        ):
            raise SystemExit(f"sourcemap in site: {relative}")
        files[relative.as_posix()] = {"bytes": path.stat().st_size, "sha256": digest(path)}
    missing = set(ENTRIES).difference(files)
    if missing:
        raise SystemExit("missing site entries: " + ", ".join(sorted(missing)))
    return files, directories


def package(destination):
    site = Path("dist")
    files, directories = inventory(site)
    head = output("git", "rev-parse", "HEAD")
    version = os.getenv("PACKAGE_VERSION") or head
    if not re.fullmatch(r"[A-Za-z0-9._-]+", version):
        raise SystemExit(f"invalid package version: {version!r}")
    archive = destination / f"overlays-site-{version}.tar.gz"
    with tarfile.open(archive, "w:gz", compresslevel=6) as tar:
        for name in [*directories, *files]:
            tar.add(site / name, arcname=name, recursive=False)

    with tarfile.open(archive, "r:gz") as tar:
        verified = {}
        for member in tar:
            if member.isdir():
                continue
            if not member.isfile() or member.name in verified:
                raise SystemExit(f"unexpected archive entry: {member.name}")
            with tar.extractfile(member) as file:
                verified[member.name] = {
                    "bytes": member.size,
                    "sha256": hashlib.file_digest(file, "sha256").hexdigest(),
                }
        if verified != files:
            raise SystemExit("archive contents differ from dist")

    submodules = {}
    for line in output("git", "submodule", "status", "--recursive").splitlines():
        sha, path, *_ = line.split()
        if not re.fullmatch(r"[0-9a-f]{40}", sha):
            raise SystemExit(f"submodule differs from committed revision: {line}")
        submodules[path] = {"sha": sha}
        if (lock := Path(path) / "bun.lock").is_file():
            submodules[path]["bun_lock_sha256"] = digest(lock)

    groups = {}
    for name, info in files.items():
        group = name.partition("/")[0] if "/" in name else "."
        row = groups.setdefault(group, {"files": 0, "bytes": 0})
        row["files"] += 1
        row["bytes"] += info["bytes"]
        row["over_20_files"] = row["files"] > 20

    report = destination / "build-manifest.json"
    report.write_text(json.dumps({
        "commit": head,
        "submodules": submodules,
        "runner": {**platform.freedesktop_os_release(), "image": os.getenv("ImageVersion")},
        "tools": {"node": output("node", "--version"), "bun": output("bun", "--version")},
        "timings": [json.loads(line) for line in (destination / "timings.jsonl").read_text().splitlines()],
        "projects": groups,
        "files": len(files),
        "bytes": sum(file["bytes"] for file in files.values()),
    }, indent=2) + "\n")
    (destination / "SHA256SUMS").write_text(
        f"{digest(archive)}  {archive.name}\n{digest(report)}  {report.name}\n"
    )
    print(archive, flush=True)


if __name__ == "__main__":
    action, *args = sys.argv[1:]
    if action == "run":
        sys.exit(run(*args))
    if action == "strip-maps":
        strip_maps(Path(args[0]))
    elif action == "package":
        package(Path(args[0]))
    else:
        raise SystemExit(f"unknown action: {action}")

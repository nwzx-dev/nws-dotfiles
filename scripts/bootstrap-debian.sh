#!/usr/bin/env bash
set -Eeuo pipefail
REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

SCRIPT_NAME="Debian bootstrap"

if [[ ! -r /etc/os-release ]]; then
    echo "[$SCRIPT_NAME] SKIP: /etc/os-release not found."
    exit 0
fi

source /etc/os-release

if [[ "${ID:-}" != "debian" ]]; then
    echo "[$SCRIPT_NAME] SKIP: detected '${ID:-unknown}', expected 'debian'."
    exit 0
fi

echo "[$SCRIPT_NAME] Running on Debian ${VERSION_ID:-unknown}."

if ! command -v apt >/dev/null 2>&1; then
    echo "[$SCRIPT_NAME] ERROR: apt was not found."
    exit 1
fi

echo "[$SCRIPT_NAME] Updating package lists..."
sudo apt update

while IFS= read -r package; do
    [[ -z "$package" || "$package" == \#* ]] && continue

    if apt-cache show "$package" >/dev/null 2>&1; then
        echo "[$SCRIPT_NAME] Installing: $package"
        sudo apt install -y "$package"
    else
        echo "[$SCRIPT_NAME] SKIP: package unavailable: $package"
    fi
done < "$REPO_DIR/packages/debian.txt"

echo "[$SCRIPT_NAME] Complete."

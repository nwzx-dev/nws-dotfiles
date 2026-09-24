#!/usr/bin/env bash
set -Eeuo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ ! -r /etc/os-release ]]; then
    echo "ERROR: /etc/os-release not found."
    exit 1
fi

source /etc/os-release

case "${ID:-}" in
    debian)
        exec "$REPO_DIR/scripts/bootstrap-debian.sh"
        ;;
    fedora)
        exec "$REPO_DIR/scripts/bootstrap-fedora.sh"
        ;;
    arch)
        exec "$REPO_DIR/scripts/bootstrap-arch.sh"
        ;;
    ubuntu)
        echo "Ubuntu detected."
        echo "No Ubuntu bootstrap is configured yet."
        echo "Use the Debian manifest only after explicitly deciding to do so."
        exit 0
        ;;
    *)
        echo "Unsupported distro: ${ID:-unknown}"
        exit 1
        ;;
esac
EOF
#!/usr/bin/env bash

set -euo pipefail

USERNAME="guest"

if id "$USERNAME" &>/dev/null; then
    exit 0
fi

useradd \
    --create-home \
    --shell /bin/bash \
    "$USERNAME"

passwd -d "$USERNAME"

echo "Created passwordless guest user: $USERNAME"
#!/usr/bin/env bash

set -euo pipefail

USERNAME="admin"
PASSWORD="admin"

if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists."
    exit 0
fi

useradd \
    --create-home \
    --shell /bin/bash \
    --groups wheel \
    "$USERNAME"

echo "$USERNAME:$PASSWORD" | chpasswd

echo "Created test administrator user '$USERNAME'."
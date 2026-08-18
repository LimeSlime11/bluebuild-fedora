#!/usr/bin/env bash

set -euo pipefail

USERNAME="guest"

echo "[+] Resetting guest user..."

# If the user exists, terminate all of their sessions/processes.
if id "$USERNAME" &>/dev/null; then
    loginctl terminate-user "$USERNAME" || true
    sleep 1

    userdel --remove "$USERNAME" || true
fi

# Remove leftover group, if any.
if getent group "$USERNAME" &>/dev/null; then
    groupdel "$USERNAME" || true
fi

# Create a completely fresh guest account.
useradd \
    --create-home \
    --shell /bin/bash \
    "$USERNAME"

# Remove the password so the account has no password.
passwd -d "$USERNAME"

echo "[+] Guest user ready."
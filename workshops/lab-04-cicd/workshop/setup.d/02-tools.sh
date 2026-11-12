#!/bin/bash

# Terraform and the GitHub CLI arrive from resources/workshop.yaml's files,
# and vendir drops the executable bit when it unpacks an HTTP download.

set -euo pipefail

for tool in "$HOME/.local/bin/terraform" "$HOME/bin/gh"; do
    if [ -f "$tool" ]; then
        chmod +x "$tool"
    fi
done

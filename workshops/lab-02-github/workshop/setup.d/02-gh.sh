#!/bin/bash

# The GitHub CLI arrives in ~/bin from resources/workshop.yaml's files, and
# vendir drops the executable bit when it unpacks an HTTP download.

set -euo pipefail

if [ -f "$HOME/bin/gh" ]; then
    chmod +x "$HOME/bin/gh"
fi

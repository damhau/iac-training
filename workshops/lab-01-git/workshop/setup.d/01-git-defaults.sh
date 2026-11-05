#!/bin/bash

# Runs as the learner when the session container starts (again after a
# restart, so it must be idempotent). Makes Git's output match the
# instructions: new repositories on main, and nano when Git asks for a
# message (git revert, step 8). The learner sets user.name and user.email
# themselves in step 0.

set -euo pipefail

git config --global init.defaultBranch main
git config --global core.editor nano

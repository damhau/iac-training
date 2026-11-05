#!/bin/bash

# Runs as the learner when the session container starts (again after a
# restart, so it must be idempotent). Makes Git's output match the last page:
# new repositories on main, nano when Git asks for a message. The learner sets
# user.name and user.email themselves.

set -euo pipefail

git config --global init.defaultBranch main
git config --global core.editor nano

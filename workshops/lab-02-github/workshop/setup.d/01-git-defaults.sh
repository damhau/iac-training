#!/bin/bash

# Runs as the learner when the session container starts (again after a
# restart, so it must be idempotent). Makes Git's output match the
# instructions, as in Lab 1: new repositories on main, nano when Git asks for
# a message. And git pull merges when the branches have diverged (the second
# hour's conflict), where Git would otherwise stop and ask how to reconcile.
# The learner sets user.name and user.email themselves.

set -euo pipefail

git config --global init.defaultBranch main
git config --global core.editor nano
git config --global pull.rebase false

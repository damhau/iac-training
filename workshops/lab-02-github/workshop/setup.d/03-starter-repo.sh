#!/bin/bash

# Builds ~/starter/netops-lab.bundle: netops-lab as Lab 1 leaves it, for
# learners who didn't keep their own (01-your-repo). The same commands as
# Lab 1's pages, the conflict resolved as step 7 asks. A fixed author and
# fixed dates make the commit IDs the same in every session.
#
# Runs at every container start: does nothing once the bundle exists.

set -euo pipefail

bundle=$HOME/starter/netops-lab.bundle

if [ -f "$bundle" ]; then
    exit 0
fi

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

export GIT_AUTHOR_NAME="IaC training" GIT_AUTHOR_EMAIL="training@example.com"
export GIT_COMMITTER_NAME="IaC training" GIT_COMMITTER_EMAIL="training@example.com"

minute=0

# Runs a command that creates a commit, a minute after the previous one.
at_next_minute() {
    minute=$((minute + 1))
    GIT_AUTHOR_DATE="2026-01-05T09:0${minute}:00+0100" \
        GIT_COMMITTER_DATE="2026-01-05T09:0${minute}:00+0100" \
        "$@"
}

cd "$work"
git init -q -b main netops-lab
cd netops-lab

# Steps 2 and 3.
mkdir devices
printf "hostname core-sw01\nntp server 10.0.0.1\n" > devices/core-sw01.cfg
printf "hostname edge-rtr01\n" > devices/edge-rtr01.cfg
echo "*.log" > .gitignore
git add .
at_next_minute git commit -q -m "Initial config baseline for core-sw01 and edge-rtr01"

# Step 4.
echo "ntp server 10.0.0.2" >> devices/core-sw01.cfg
at_next_minute git commit -q -am "Add secondary NTP server to core-sw01"

# Step 5.
git switch -q -c feature/add-syslog
echo "logging host 10.0.0.50" >> devices/core-sw01.cfg
at_next_minute git commit -q -am "Add syslog target to core-sw01"

# Step 6.
git switch -q main
echo "logging host 10.0.0.99" >> devices/core-sw01.cfg
at_next_minute git commit -q -am "Add different syslog target on main"

# Step 7: the merge stops on the conflict, as in the lab.
if git merge -q feature/add-syslog >/dev/null 2>&1; then
    echo "expected a merge conflict on core-sw01.cfg" >&2
    exit 1
fi
printf "hostname core-sw01\nntp server 10.0.0.1\nntp server 10.0.0.2\nlogging host 10.0.0.50\n" \
    > devices/core-sw01.cfg
git add devices/core-sw01.cfg
at_next_minute git commit -q -m "Merge syslog change, keep 10.0.0.50 as agreed"

# Step 8.
echo "no ntp server 10.0.0.1" >> devices/core-sw01.cfg
at_next_minute git commit -q -am "Remove primary NTP server from core-sw01"
at_next_minute git revert --no-edit HEAD >/dev/null

mkdir -p "$(dirname "$bundle")"
git bundle create -q "$bundle" --all

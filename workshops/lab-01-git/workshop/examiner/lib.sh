# Sourced by the checks in tests/. The dashboard only shows a check as passed
# or failed; what a check prints goes to
# ~/.local/share/workshop/examiner-scripts.log, so each one prints the reason,
# and the instructions tell learners to read it with tail.
#
# Checks read committed history rather than the working tree where they can,
# so a check still passes when the learner has moved on to later steps (the
# last page reruns them all). A git log limited to a path needs
# --full-history: the step 7 merge keeps the feature branch's version of
# core-sw01.cfg, and without it Git hides main's own side of the merge.

fail() {
    echo "FAIL: $*"
    exit 1
}

pass() {
    echo "OK: $*"
    exit 0
}

# The terminal starts in ~/exercises; ~/netops-lab covers a learner who ran
# cd alone before step 1.
find_repo() {
    local dir
    for dir in "$HOME/exercises/netops-lab" "$HOME/netops-lab"; do
        if [ -d "$dir/.git" ]; then
            REPO=$dir
            return 0
        fi
    done
    fail "no repository at ~/exercises/netops-lab: from ~/exercises, run mkdir netops-lab && cd netops-lab && git init (step 1)"
}

g() {
    git -C "$REPO" "$@"
}

has_branch() {
    g rev-parse --quiet --verify "refs/heads/$1" >/dev/null
}

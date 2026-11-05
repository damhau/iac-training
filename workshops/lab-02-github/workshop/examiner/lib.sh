# Sourced by the checks in tests/. The dashboard only shows a check as passed
# or failed; what a check prints goes to
# ~/.local/share/workshop/examiner-scripts.log, so each one prints the reason,
# and the instructions tell learners to read it with tail.
#
# Checks pass again once the learner has moved on (the last page reruns
# them): a branch deleted after its merge still counts as pushed, for
# example.
#
# GitHub is read with gh, signed in as the learner, so each learner has their
# own API rate limit; unauthenticated calls would share 60 an hour for the
# whole class, from the cluster's one address.

export PATH=$HOME/bin:$PATH
export GH_TELEMETRY=0 GH_NO_UPDATE_NOTIFIER=1 GH_PROMPT_DISABLED=1 NO_COLOR=1
# A check must never wait for a password.
export GIT_TERMINAL_PROMPT=0

fail() {
    echo "FAIL: $*"
    exit 1
}

pass() {
    echo "OK: $*"
    exit 0
}

# The terminal starts in ~/exercises; ~/netops-lab covers a learner who
# cloned from their home.
find_repo() {
    local dir
    for dir in "$HOME/exercises/netops-lab" "$HOME/netops-lab"; do
        if [ -d "$dir/.git" ]; then
            REPO=$dir
            return 0
        fi
    done
    fail "no repository at ~/exercises/netops-lab: clone your bundle or the starter there (Before you start: your repo)"
}

g() {
    git -C "$REPO" "$@"
}

has_branch() {
    g rev-parse --quiet --verify "refs/heads/$1" >/dev/null
}

# The signed-in GitHub user, as LOGIN, and their netops-lab, as SLUG.
github_login() {
    command -v gh >/dev/null ||
        fail "gh is missing from this session: end it and start a new one from the portal"
    LOGIN=$(gh api user --jq .login 2>/dev/null) ||
        fail "not signed in to GitHub: gh auth login --hostname github.com --git-protocol https --web (Before you start: sign in)"
    SLUG=$LOGIN/netops-lab
}

# github_login, then fails unless the repository exists.
github_repo() {
    github_login
    gh api "repos/$SLUG" --silent 2>/dev/null ||
        fail "no repository github.com/$SLUG: create it on GitHub, named netops-lab (step 1)"
}

# The pull request from change/add-snmp, open, closed or merged: its number as
# PR, empty if there is none.
find_pr() {
    PR=$(gh pr list -R "$SLUG" --state all --head change/add-snmp --json number --jq '.[0].number // empty' 2>/dev/null) ||
        fail "can't list the pull requests of github.com/$SLUG: does the repository still exist?"
}

# Field of the pull request PR, with a jq expression.
pr_field() {
    gh pr view "$PR" -R "$SLUG" --json "$1" --jq "$2"
}

# The issue the pull request closes: GitHub's link from "Closes #N", or, if
# that is gone, the issue about SNMP. Its number as ISSUE, empty if none.
find_issue() {
    ISSUE=""
    if [ -n "${PR:-}" ]; then
        ISSUE=$(pr_field closingIssuesReferences '.closingIssuesReferences[0].number // empty' 2>/dev/null) || true
    fi
    if [ -z "$ISSUE" ]; then
        ISSUE=$(gh issue list -R "$SLUG" --state all --limit 100 --json number,title \
            --jq '[.[] | select(.title | test("snmp"; "i"))] | last | .number // empty' 2>/dev/null) || true
    fi
}

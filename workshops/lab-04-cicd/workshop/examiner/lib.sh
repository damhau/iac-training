# Sourced by the checks in tests/. The dashboard only shows a check as passed
# or failed; what a check prints goes to
# ~/.local/share/workshop/examiner-scripts.log, so each one prints the reason,
# and the instructions tell learners to read it with tail.
#
# The checks read GitHub with gh, signed in as the learner: the repository
# <login>/tf-lab, the pull request from ci/add-pipeline, and the runs of
# .github/workflows/terraform.yml. GitHub keeps every run, so a check passes
# again once the learner has moved on (the last page reruns them).

export PATH=$HOME/.local/bin:$HOME/bin:$PATH
export CHECKPOINT_DISABLE=1
export GH_TELEMETRY=0 GH_NO_UPDATE_NOTIFIER=1 GH_PROMPT_DISABLED=1 NO_COLOR=1
# A check must never wait for a password.
export GIT_TERMINAL_PROMPT=0

BRANCH=ci/add-pipeline
WORKFLOW=.github/workflows/terraform.yml

fail() {
    echo "FAIL: $*"
    exit 1
}

pass() {
    echo "OK: $*"
    exit 0
}

# The terminal starts in ~/exercises; ~/tf-lab covers a learner who cloned
# from their home.
find_repo() {
    local dir
    for dir in "$HOME/exercises/tf-lab" "$HOME/tf-lab"; do
        if [ -d "$dir/.git" ]; then
            REPO=$dir
            return 0
        fi
    done
    fail "no repository at ~/exercises/tf-lab: from ~/exercises, git clone https://github.com/<you>/tf-lab.git (Before you start: your tf-lab)"
}

g() {
    git -C "$REPO" "$@"
}

# The signed-in GitHub user, as LOGIN, and their tf-lab, as SLUG.
github_login() {
    command -v gh >/dev/null ||
        fail "gh is missing from this session: end it and start a new one from the portal"
    LOGIN=$(gh api user --jq .login 2>/dev/null) ||
        fail "not signed in to GitHub: gh auth login --hostname github.com --git-protocol https --web --scopes workflow"
    SLUG=$LOGIN/tf-lab
}

# github_login, then fails unless the repository exists.
github_repo() {
    github_login
    gh api "repos/$SLUG" --silent 2>/dev/null ||
        fail "no repository github.com/$SLUG: create it on GitHub, public and empty (Before you start: your tf-lab)"
}

# GitHub refuses a push that adds or changes .github/workflows/ from a token
# without the workflow scope, and gh's default sign-in doesn't ask for it.
need_workflow_scope() {
    gh api --include user 2>/dev/null | grep -i '^x-oauth-scopes:' | grep -qw workflow ||
        fail "signed in as $LOGIN, but GitHub won't take a workflow from this sign-in: gh auth refresh --hostname github.com --scopes workflow"
}

# The pull request from ci/add-pipeline, open, closed or merged: its number as
# PR. Fails if there is none.
find_pr() {
    PR=$(gh pr list -R "$SLUG" --state all --head "$BRANCH" --json number --jq '.[0].number // empty' 2>/dev/null) ||
        fail "can't list the pull requests of github.com/$SLUG: does the repository still exist?"
    [ -n "$PR" ] ||
        fail "no pull request from $BRANCH yet: open one on GitHub, into main (step 2)"
}

# Field of the pull request PR, with a jq expression.
pr_field() {
    gh pr view "$PR" -R "$SLUG" --json "$1" --jq "$2"
}

# The workflow's runs for an event ($1) on a branch ($2), newest first, one
# per line: id number status conclusion head_sha. A pull request's runs are
# on its head branch, and their head_sha is the branch's commit.
runs() {
    gh api -X GET "repos/$SLUG/actions/runs" -f event="$1" -f branch="$2" -F per_page=20 \
        --jq ".workflow_runs[] | select(.path == \"$WORKFLOW\")
            | \"\(.id) \(.run_number) \(.status) \(.conclusion) \(.head_sha)\"" 2>/dev/null
}

# The name of the first step that failed in run $1, empty if none did (a
# workflow file GitHub can't read fails before any step).
failed_step() {
    gh api "repos/$SLUG/actions/runs/$1/jobs" \
        --jq '[.jobs[].steps[] | select(.conclusion == "failure") | .name][0] // empty' 2>/dev/null
}

# Fails unless the run on line $1 (from runs) completed with success, naming
# it $2 in the reason, and giving $3 as the fix.
need_success() {
    local id number status conclusion step
    read -r id number status conclusion _ <<<"$1"
    [ "$status" = completed ] ||
        fail "run #$number, $2, is still running: wait for it on GitHub, then check again"
    if [ "$conclusion" != success ]; then
        step=$(failed_step "$id")
        fail "run #$number, $2, ended in ${conclusion}${step:+ on $step}: ${3:-open it in the Actions tab to read why}"
    fi
    RUN=$number
}

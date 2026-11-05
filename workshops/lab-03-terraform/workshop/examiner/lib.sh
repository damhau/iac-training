# Sourced by the checks in tests/. The dashboard only shows a check as passed
# or failed; what a check prints goes to
# ~/.local/share/workshop/examiner-scripts.log, so each one prints the reason,
# and the instructions tell learners to read it with tail.
#
# A check that passed once stays passed: step 6 destroys what steps 3 to 5
# created, and the last page reruns their checks. Each pass is recorded in
# ~/.local/share/workshop/checks-passed, and a later failure of the same
# check reports the recorded pass instead.

export PATH=$HOME/.local/bin:$HOME/bin:$PATH
export CHECKPOINT_DISABLE=1 TF_INPUT=0
export GH_TELEMETRY=0 GH_NO_UPDATE_NOTIFIER=1 GH_PROMPT_DISABLED=1 NO_COLOR=1
# A check must never wait for a password.
export GIT_TERMINAL_PROMPT=0

CHECK=$(basename "$0")
PASSED=$HOME/.local/share/workshop/checks-passed

fail() {
    if [ -f "$PASSED/$CHECK" ]; then
        echo "OK, checked earlier: $(cat "$PASSED/$CHECK")"
        exit 0
    fi
    echo "FAIL: $*"
    exit 1
}

pass() {
    mkdir -p "$PASSED"
    echo "$*" >"$PASSED/$CHECK"
    echo "OK: $*"
    exit 0
}

# The terminal starts in ~/exercises; ~/tf-lab covers a learner who created
# it from their home.
find_project() {
    local dir
    for dir in "$HOME/exercises/tf-lab" "$HOME/tf-lab"; do
        if [ -d "$dir" ]; then
            TF=$dir
            return 0
        fi
    done
    fail "no folder ~/exercises/tf-lab: from ~/exercises, mkdir tf-lab && cd tf-lab (step 1)"
}

tf() {
    terraform -chdir="$TF" "$@"
}

# The managed device configs, one per line: local_file.config["core-sw01"]...
configs_in_state() {
    tf state list 2>/dev/null | grep '^local_file\.config\['
}

# Whether main.tf's devices map has the device, with that address.
has_device() {
    grep -qE "^[[:space:]]*$1[[:space:]]*=[[:space:]]*\"${2//./\\.}\"" "$TF/main.tf"
}

# The signed-in GitHub user, as LOGIN, and their tf-lab, as SLUG.
github_login() {
    command -v gh >/dev/null ||
        fail "gh is missing from this session: end it and start a new one from the portal"
    LOGIN=$(gh api user --jq .login 2>/dev/null) ||
        fail "not signed in to GitHub: gh auth login --hostname github.com --git-protocol https --web"
    SLUG=$LOGIN/tf-lab
}

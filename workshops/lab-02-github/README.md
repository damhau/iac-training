# Lab 2: propose a change like a CAB

Session 2, GitHub. About 2 hours: 8 steps, then a second hour of stretch tasks. Works in pairs: partners review
each other's pull requests.

The learner pushes `netops-lab`, their Session 1 repository, to a public repository of their own on GitHub,
then runs a change through it: an issue, a branch, a pull request that closes the issue, a review, a merge, and
a pull back down.

## Pages and checks

| Page | Step | Check (`workshop/examiner/tests/`) |
| --- | --- | --- |
| `01-your-repo` | Before you start: name, e-mail, `netops-lab` | `git-identity`, `repo-ready` |
| `02-sign-in` | Before you start: sign in to GitHub | `gh-signed-in` |
| `03-create-repo` | 1. Create an empty repository on GitHub | `repo-created` |
| `04-push` | 2. Connect your repo and push it | `pushed` |
| `05-issue` | 3. Open an issue | `issue-opened` |
| `06-branch` | 4. Start the change on a branch and push it | `branch-pushed` |
| `07-pull-request` | 5. Open a pull request | `pr-opened` |
| `08-review` | 6. Review your partner's pull request | `reviewed` |
| `09-merge` | 7. Merge | `merged` |
| `10-clean-up` | 8. Clean up locally | `pulled` |
| `11-stretch` | Second hour | none |
| `99-summary` | Done when, and signing out | the step checks, run on page load |

The checks read GitHub with `gh`, signed in as the learner: the repository `<login>/netops-lab`, and the pull
request from `change/add-snmp`. Each learner uses their own API rate limit.

## Differences from the classroom version

- **The repo from Session 1:** the learner uploads the `netops-lab.bundle` Lab 1's last page had them
  download, or clones `~/starter/netops-lab.bundle`, built at session start with Lab 1's commands
  (`workshop/setup.d/03-starter-repo.sh`). Either clone points at the bundle as `origin`, which they remove.
- **Signing in:** `gh auth login` with a one-time code, rather than an SSH key: no key to copy out of the
  session, and the same sign-in serves `git push` (HTTPS) and the checks. SSH moves to the second hour, as
  homework on the learner's laptop. The last page signs out, and explains that revoking the token on GitHub
  signs out every `gh` of theirs.
- **The name and e-mail** are set again, the e-mail being the GitHub account's.
- **The second hour's conflict** gets commands, and the collaborator step comes first: a partner needs write
  access to push a branch.

## Session

- Base image, no custom build, plus the GitHub CLI: `gh` v2.103.3, downloaded at session start into `~/bin`
  (`resources/workshop.yaml`), with its telemetry off (`workshop/profile`).
- Reaches github.com (HTTPS); no Kubernetes access (`session.namespaces.security.token.enabled: false`).
- Editor, examiner and uploads (into `~/uploads`) enabled.
- 1Gi of memory (the editor's default).
- The learner's GitHub sign-in sits in the session's home directory until the session is deleted.

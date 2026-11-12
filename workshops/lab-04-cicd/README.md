# Lab 4: merge a PR, watch the pipeline run

Session 4, CI/CD. About 2 hours: 5 steps, a discussion on the gated apply, then a second hour of stretch tasks.
Needs `tf-lab` on GitHub, from Lab 3's last page, or the starter this session has.

The learner adds `.github/workflows/terraform.yml` to `tf-lab` on a branch: `terraform fmt -check`, `init`,
`validate` and `plan`, on every pull request into `main` and every push to it. They open a pull request and
read the run, break the formatting and watch it fail, fix it with `terraform fmt` and watch it pass, then
merge and watch the run on `main`. The second hour adds the `apply` job, behind a `production` environment
with the learner as required reviewer, and keeps the rendered configs as an artifact.

## Pages and checks

| Page | Step | Check (`workshop/examiner/tests/`) |
| --- | --- | --- |
| `01-sign-in` | Before you start: name, e-mail, sign in to GitHub | `git-identity`, `gh-signed-in` |
| `02-your-repo` | Before you start: clone `tf-lab` | `repo-ready` |
| `03-workflow` | 1. Add the workflow on a branch | `workflow-pushed` |
| `04-pull-request` | 2. Open a pull request, watch the checks | `pr-opened` |
| `05-break` | 3. Break the formatting, watch CI fail | `ci-failed` |
| `06-fix` | 4. Fix it, watch CI pass | `ci-passed` |
| `07-merge` | 5. Merge, watch the run on `main` | `merged` |
| `08-gated-apply` | Discussion: the gated apply | none |
| `09-stretch` | Second hour | none |
| `99-summary` | Done when, where to go next, and signing out | the step checks, run on page load |

The checks read GitHub with `gh`, signed in as the learner: the repository `<login>/tf-lab`, the pull request
from `ci/add-pipeline`, and the runs of `.github/workflows/terraform.yml` (the Actions REST API, filtered on
the workflow's path). GitHub keeps every run, so the checks of steps 3 and 4 still pass after the merge. A
check clicked while its run is in progress fails with "still running".

## Differences from the classroom version

- **Before you start** is new. The session is a fresh machine: name and e-mail, then Lab 2's `gh` sign-in, plus
  `--scopes workflow`: GitHub refuses a push that adds or changes `.github/workflows/` from an OAuth token
  without that scope, and `gh`'s default sign-in doesn't ask for it. Then `tf-lab` is cloned from GitHub.
- **No `tf-lab` on GitHub?** `~/starter/tf-lab.bundle`, built at session start
  (`workshop/setup.d/03-starter-repo.sh`): Lab 3's `main.tf` after step 4, its `.gitignore` and the lock file
  for `hashicorp/local` 2.9.1, written out so the build needs no network. The learner clones it, points
  `origin` at a new, empty `tf-lab` and pushes.
- **Step 1** writes the workflow with a heredoc, as Lab 3 writes `main.tf`, and opens it in the Editor tab to
  read. The `# .github/workflows/terraform.yml` label line is dropped, since the command names the file.
- **Step 3** runs `terraform fmt -check` in the terminal before pushing, to show that the same check runs on
  the laptop.
- **The second hour's apply job** gets commands: appended with `cat >>`, on a branch `ci/add-apply`, with the
  `production` environment created before the merge. If the environment doesn't exist, the job creates it with
  no reviewers and applies at once.
- **Where to go next** is on the last page.

## Session

- Base image, no custom build, plus Terraform 1.17.1 in `~/.local/bin`, for `terraform fmt` in steps 3 and 4,
  and `gh` 2.103.3 in `~/bin`, both downloaded at session start (`resources/workshop.yaml`). Terraform's
  version check and `gh`'s telemetry are off (`workshop/profile`).
- The pipeline runs on GitHub's hosted runners, in the learner's public repository: free, and nothing runs on
  the cluster. The runner's Terraform is `setup-terraform`'s default, the latest.
- Reaches github.com (HTTPS); no Kubernetes access (`session.namespaces.security.token.enabled: false`).
- Editor and examiner enabled.
- 1Gi of memory (the editor's default).
- The learner's GitHub sign-in, with the `repo` and `workflow` scopes, sits in the session's home directory
  until the session is deleted.

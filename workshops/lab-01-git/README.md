# Lab 1: version your network configs

Session 1, Git. About 2 hours: 8 steps, then a second hour of stretch tasks.

The learner treats a small folder of mock network configs, `~/exercises/netops-lab`, the way they would
treat real device configs: init, commit, diff, branch, a merge conflict on a syslog target, and a revert.

## Pages and checks

| Page | Step | Check (`workshop/examiner/tests/`) |
| --- | --- | --- |
| `01-identity` | 0. Tell Git who you are | `git-identity` |
| `02-init` | 1. Create and initialise a repo | `repo-initialised` |
| `03-configs` | 2. Create some "configs" | (checked with step 3) |
| `04-first-commit` | 3. First commit | `first-commit` |
| `05-diff` | 4. Make a tracked change | `ntp-commit` |
| `06-branch` | 5. Branch for a risky change | `syslog-branch` |
| `07-main-changes` | 6. Meanwhile main also changes | `main-diverged` |
| `08-merge-conflict` | 7. Merge and resolve the conflict | `merge-resolved` |
| `09-revert` | 8. Practise rollback | `reverted` |
| `10-stretch` | Second hour | none |
| `99-summary` | Done when, and download the repo | all of the above, run on page load |

## Differences from the classroom version

- **Step 0** is new: the session is a fresh machine, so the learner sets `user.name` and `user.email`.
- The session sets `init.defaultBranch=main` and `core.editor=nano` (`workshop/setup.d`), and shows the branch
  in the prompt (`workshop/profile`).
- Step 7 can be done in nano or in the Editor tab's merge view.
- "Keep `netops-lab` on your laptop": the session is deleted when it ends, so the last page has the learner
  pack it with `git bundle` and download it.

## Session

- Base image, no custom build: Fedora with git, nano and vim.
- No Kubernetes access (`session.namespaces.security.token.enabled: false`).
- Editor and examiner enabled; downloads limited to `~/exercises`.
- 1Gi of memory (the editor's default).

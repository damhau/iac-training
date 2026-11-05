# Lab 3: manage infrastructure declaratively

Session 3, Terraform. About 2 hours: 7 steps, a second hour of stretch tasks, then `tf-lab` pushed to GitHub,
required for Session 4.

The learner writes `~/exercises/tf-lab/main.tf`, which renders one config file per device with the
`hashicorp/local` provider, and runs the workflow on it: init, fmt, validate, plan, apply, two more devices
from the variable, drift made by hand and healed, the state inspected, destroy, and a `.gitignore` that keeps
the state out of Git.

## Pages and checks

| Page | Step | Check (`workshop/examiner/tests/`) |
| --- | --- | --- |
| `01-project` | 1. Create the project | `project-created` |
| `02-main-tf` | 2. Write `main.tf` | `main-tf` |
| `03-workflow` | 3. Run the core workflow | `applied` |
| `04-add-devices` | 4. Add two devices declaratively | `devices-added` |
| `05-drift` | 5. Cause drift by hand, and let Terraform heal it | `drift-healed` |
| `06-state-destroy` | 6. Inspect the state, then clean up | `destroyed` |
| `07-gitignore` | 7. Keep state out of Git | `gitignore` |
| `08-stretch` | Second hour | none |
| `09-push` | Before Session 4: `tf-lab` on GitHub | `git-identity`, `gh-signed-in`, `pushed` |
| `99-summary` | Done when, and signing out | the step checks, run on page load |

Step 6 deletes what the checks of steps 3 to 5 look at, so a check that passed once stays passed: each pass is
recorded in `~/.local/share/workshop/checks-passed` (`workshop/examiner/lib.sh`). Step 5's check knows the
drift happened because `core-sw01.cfg`, first written in step 3, is newer than `edge-rtr01.cfg`, written in
step 4.

## Differences from the classroom version

- **On the session, not the laptop:** Terraform 1.17.1 comes with the session; `terraform init` downloads the
  provider from the Terraform registry.
- **Step 6** also shows the state's content, which is why step 7 keeps it out of Git.
- **The second hour** starts with `terraform apply`, since step 6 destroyed the configs, and applies the NTP
  change, so that the template's plan shows `No changes`.
- **The push for Session 4** is a page of its own, with a check: name and e-mail set again, then the `gh`
  sign-in and HTTPS of Lab 2, rather than SSH. The SSH address is a note, for the laptop.

## Session

- Base image, no custom build, plus Terraform 1.17.1 in `~/.local/bin` and `gh` 2.103.3 in `~/bin`, both
  downloaded at session start (`resources/workshop.yaml`). Terraform's version check and `gh`'s telemetry are
  off (`workshop/profile`).
- Reaches the Terraform registry and github.com (HTTPS); no Kubernetes access
  (`session.namespaces.security.token.enabled: false`).
- Editor and examiner enabled.
- 1Gi of memory (the editor's default).
- The learner's GitHub sign-in, if they do the last page, sits in the session's home directory until the
  session is deleted.

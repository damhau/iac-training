---
title: Overview
---

Session 3, Terraform. About 2 hours. You run the full Terraform workflow: Terraform writes one config file per
device, with the `hashicorp/local` provider. You need no cloud account.

**Objective:** understand declarative infrastructure as code, and run the core Terraform workflow end to end.

**NetEng anchor:** Terraform is intended config as code. `terraform plan` is a dry-run, your `commit confirmed`:
it shows exactly what would change before you touch anything. State drift is config drift.

## How this lab works

- As in Sessions 1 and 2: the instructions on this side, a Linux terminal on the other, VS Code in the
  **Editor** tab. Terraform is installed; `terraform init` downloads the provider it needs.
- Type the commands yourself. Each command block has a copy button for long lines: paste into the terminal,
  check it, press Enter.
- Most steps end with a blue **Check** box. Click it: green means the step is done. If one turns red, the
  command at the end of this section prints the reason.
- Click each check before moving on: step 6 deletes the configs that the checks of steps 3 to 5 look at. A
  check that passed stays passed.
- Nothing here touches a real device or a cloud: the provider writes files on this machine.
- The session lasts 2 hours. When the timer at the top turns orange, click it to add time. The session is
  deleted when it ends: the last page puts `tf-lab` on GitHub, for Session 4.

When a check turns red, paste this into the terminal to see why:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: tail -n 1 ~/.local/share/workshop/examiner-scripts.log
```

## Steps

1. Create the project
2. Write `main.tf`
3. Run the core workflow
4. Add two devices declaratively
5. Cause drift by hand, and let Terraform heal it
6. Inspect the state, then clean up
7. Keep state out of Git

Then a second hour of stretch tasks, and before Session 4, `tf-lab` on GitHub.

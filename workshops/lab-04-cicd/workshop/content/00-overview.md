---
title: Overview
---

Session 4, CI/CD. About 2 hours. You need your GitHub account, and the `tf-lab` repository on GitHub from
Session 3: yours, or the copy this session has.

**Objective:** automate validate, plan and apply, so that merging a pull request deploys infrastructure. This
ties Sessions 1 to 3 together.

**NetEng anchor:** a CI/CD pipeline is an automated change window with pre-checks. Every proposed change is
validated and dry-run automatically before a human approves it, and applied automatically after approval. It is
your change process, enforced by a robot that never forgets a step.

The plan runs in CI on every pull request: the valuable, safe part. The apply is designed in the discussion.
The local provider needs no credentials, so in the second hour you can run a real apply on the runner and keep
the rendered configs.

## How this lab works

- As in Sessions 1 to 3: the instructions on this side, a Linux terminal on the other, VS Code in the
  **Editor** tab. Much of this lab happens on [github.com](https://github.com), in another browser tab: the
  pipeline runs there, on GitHub's machines, not on this one.
- Type the commands yourself. Each command block has a copy button for long lines: paste into the terminal,
  check it, press Enter.
- Most steps end with a blue **Check** box. Click it: green means the step is done. The checks look at your
  repository on GitHub, signed in as you: its pull request and its pipeline runs. If one turns red, the command
  at the end of this section prints the reason.
- A pipeline run takes about a minute. A check clicked while one runs turns red: wait, then click it again.
- The session lasts 2 hours. When the timer at the top turns orange, click it to add time. Your work is on
  GitHub: if the session ends early, start a new one and clone `tf-lab` again.

When a check turns red, paste this into the terminal to see why:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: tail -n 1 ~/.local/share/workshop/examiner-scripts.log
```

## Steps

Before you start: sign in to GitHub, and clone `tf-lab`. Then:

1. Add the workflow on a branch
2. Open a pull request, and watch the checks run
3. Break the formatting, and watch CI fail
4. Fix it, and watch CI pass
5. Merge, and watch the run on `main`

Then the discussion, the gated apply, and a second hour of stretch tasks.

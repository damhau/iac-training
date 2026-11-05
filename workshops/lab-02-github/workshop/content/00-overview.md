---
title: Overview
---

Session 2, GitHub. About 2 hours. You need a GitHub account, and the `netops-lab` repo from Session 1: yours,
or the copy this session has.

**Objective:** push work to a shared remote and run the branch, pull request, review, merge workflow.

**NetEng anchor:** GitHub is the central source of truth, like a config backup server that understands history
and review. A pull request is your change review, your CAB: proposed change, diff, discussion, approval, then
merge.

Work in pairs: GitHub does not let you approve your own pull request, so partners review each other's.

## How this lab works

- As in Session 1: the instructions on this side, a Linux terminal on the other, VS Code in the **Editor**
  tab. Some steps happen on [github.com](https://github.com), in another browser tab.
- Type the commands yourself. Each command block has a copy button for long lines: paste into the terminal,
  check it, press Enter.
- Most steps end with a blue **Check** box. Click it: green means the step is done. The checks look at your
  repo here and, signed in as you, at your repository on GitHub. If one turns red, the command at the end of
  this section prints the reason.
- This machine reaches GitHub, and no device or cluster. You sign in to GitHub from it; the last page shows how
  to sign out.
- The session lasts 2 hours. When the timer at the top turns orange, click it to add time. From step 2 your
  work is on GitHub too: if the session ends early, start a new one and clone it back.

When a check turns red, paste this into the terminal to see why:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: tail -n 1 ~/.local/share/workshop/examiner-scripts.log
```

## Steps

Before you start: bring your repo, and sign in to GitHub. Then:

1. Create an empty repository on GitHub
2. Connect your repo and push it
3. Open an issue
4. Start the change on a branch and push it
5. Open a pull request
6. Review your partner's pull request
7. Merge
8. Clean up locally

Then a second hour of stretch tasks.

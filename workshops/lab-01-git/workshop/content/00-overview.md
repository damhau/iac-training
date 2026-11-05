---
title: Overview
---

Session 1, Git. About 2 hours.

**Objective:** understand Git's model and run the core local workflow fluently.

**NetEng anchor:** a Git repo is a smart config archive. A commit is a saved change with a ticket reference.
A branch is a candidate config you can test before committing, like Junos candidate vs committed.

You treat a small folder of mock network configs the way you would treat real device configs.

## How this lab works

- The instructions are on this side, a Linux terminal on the other. The **Editor** tab is VS Code, on the same
  machine.
- Type the commands yourself: getting them into your fingers is the point. Each command block has a copy
  button for long lines: paste into the terminal, check it, press Enter.
- Most steps end with a blue **Check** box. Click it: green means the step is done. If it turns red, the
  command at the end of this section prints the reason.
- The prompt shows the branch you're on, for example `~/exercises/netops-lab (main)`, and `|MERGING` while a
  merge is in progress. A `*` after the branch means unstaged changes, a `+` staged ones.
- The session lasts 2 hours. When the timer at the top turns orange, click it to add time.
- Nothing here touches a real device or the cluster: this machine has Git, an editor and no other access.

When a check turns red, paste this into the terminal to see why:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: tail -n 1 ~/.local/share/workshop/examiner-scripts.log
```

## Steps

0. Tell Git who you are
1. Create and initialise a repo
2. Create some "configs"
3. First commit
4. Make a tracked change
5. Branch for a risky change (candidate config)
6. Meanwhile main also changes: set up a conflict
7. Merge and resolve the conflict
8. Practise rollback: a bad change, then the safe undo

Then a second hour of stretch tasks.

{{< note >}}
The session is deleted when it ends. The last page shows how to download your repository and keep it.
{{< /note >}}

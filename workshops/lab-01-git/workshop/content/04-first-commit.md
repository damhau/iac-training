---
title: "Step 3: first commit"
---

Saving takes two moves. `git add` stages changes: it builds the candidate. `git commit` saves everything
staged as one change in the history.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git status
```

The three files are *untracked*: Git sees them but doesn't version them.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git add .
```

`.` means everything in this folder, minus what `.gitignore` excludes. Run `git status` again: the files are
now listed under "Changes to be committed". They're staged.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git commit -m "Initial config baseline for core-sw01 and edge-rtr01"
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git log --oneline
```

One line per commit: a short ID (the start of its hash) and the message. The message is the change record:
write it like a ticket summary, saying what changed and why.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: first-commit
title: The baseline is committed
```

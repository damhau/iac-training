---
title: "Step 1: create and initialise a repo"
---

Your terminal starts in `~/exercises`, the folder the Editor tab shows. Create the lab folder there:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: mkdir netops-lab && cd netops-lab
```

Turn it into a repository:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git init
```

`git init` creates a hidden `.git` folder. That is the archive: every saved version and the history. The
files next to it are the *working tree*, the config you edit.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: ls -a
```

The prompt now ends in `(main)`: you're on the branch `main`, which has no commits yet.

{{< note >}}
A new terminal, or `cd` on its own, takes you to your home folder. Come back with `cd ~/exercises/netops-lab`.
{{< /note >}}

```examiner:execute-test
prefix: Check
description: Click to check this step
name: repo-initialised
title: netops-lab is a Git repository
```

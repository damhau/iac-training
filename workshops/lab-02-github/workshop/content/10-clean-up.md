---
title: "Step 8: clean up locally"
---

The merge happened on GitHub: your `main` here doesn't have it yet.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git switch main
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git pull
```

`git pull` fetches GitHub's `main` and brings yours up to it. The merge commit from step 7 is now on top:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git log --oneline --graph
```

The branch has done its job:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git branch -d change/add-snmp
```

`-d` deletes a branch only if it is merged, so it never loses work.

{{< note >}}
Merged with *Squash and merge* or *Rebase and merge* instead? Then `git branch -d` refuses: GitHub put new
commits on `main`, not your branch's. Once `git log` shows the SNMP change on `main`, force it:
`git branch -D change/add-snmp`.
{{< /note >}}

```examiner:execute-test
prefix: Check
description: Click to check this step
name: pulled
title: main has the merge, and the branch is gone
```

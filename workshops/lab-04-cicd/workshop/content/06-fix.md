---
title: "Step 4: fix it, and watch CI pass"
---

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform fmt
```

It prints `main.tf`, the file it fixed.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git diff
```

The two spaces, gone. Commit and push the fix:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git commit -am "terraform fmt"
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git push
```

The pull request runs the workflow again, on the new commit: a green check, *All checks have passed*. The
failed run stays: the **Actions** tab lists every run, a record of each change proposed and what the
pre-checks said about it.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: ci-passed
title: CI passes on the pull request's last commit
```

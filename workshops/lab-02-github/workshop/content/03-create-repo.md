---
title: "Step 1: create an empty repository on GitHub"
---

On GitHub, create a new repository: the **+** at the top right, *New repository*.

- **Repository name:** `netops-lab`.
- **Public.** It holds mock data only, and branch protection on the free plan needs a public repo (second hour).
- **Empty:** no README, no `.gitignore`, no licence. Your repo already has its history; a file GitHub adds would
  start a second, unrelated one, and your push in step 2 would be refused.

*Create repository*. GitHub shows "Quick setup" commands for an existing repository: that's step 2.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: repo-created
title: github.com/<you>/netops-lab exists and is public
```

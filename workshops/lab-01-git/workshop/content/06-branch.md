---
title: "Step 5: branch for a risky change"
---

A branch is a candidate config: you work on a risky change without touching `main` until it's agreed.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git switch -c feature/add-syslog
```

`-c` creates the branch and switches to it. The prompt now shows `(feature/add-syslog)`.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  echo "logging host 10.0.0.50" >> devices/core-sw01.cfg
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git commit -am "Add syslog target to core-sw01"
```

`-a` stages every change to files Git already tracks, so you skip `git add`. It never picks up new files:
those still need `git add`.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: syslog-branch
title: feature/add-syslog has the syslog target
```

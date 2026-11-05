---
title: "Step 6: meanwhile main also changes"
---

While your change waits on its branch, someone adds a different syslog target on `main`. You play both
parts, and this sets up a conflict on purpose.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git switch main
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: cat devices/core-sw01.cfg
```

No `logging host 10.0.0.50`: that line only exists on the feature branch. Switching branches rewrites the
files in your working tree to that branch's version.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  echo "logging host 10.0.0.99" >> devices/core-sw01.cfg
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git commit -am "Add different syslog target on main"
```

The history has now forked:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git log --oneline --graph --all
```

```examiner:execute-test
prefix: Check
description: Click to check this step
name: main-diverged
title: main and feature/add-syslog have diverged
```

---
title: "Before you start: your tf-lab"
---

Clone `tf-lab` from GitHub into `~/exercises`, where the terminal starts:

```workshop:copy-and-edit
prefix: Copy
title: click, paste, then put your GitHub username in place of <you>
text: git clone https://github.com/<you>/tf-lab.git
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: cd tf-lab
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: ls -a
```

Session 3's files: `main.tf`, `.gitignore` and `.terraform.lock.hcl`, plus `device.cfg.tftpl` if you did the
template. No state: it stayed out of Git.

## No tf-lab on GitHub?

This session has a copy of `tf-lab` as Session 3 leaves it: three devices, the state kept out of Git. On
GitHub, create a new repository: `tf-lab`, **public**, **empty** (no README, `.gitignore` or licence). Then,
from `~/exercises`, instead of the clone above:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git clone ~/starter/tf-lab.bundle tf-lab
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: cd tf-lab
```

```workshop:copy-and-edit
prefix: Copy
title: click, paste, then put your GitHub username in place of <you>
text: git remote set-url origin https://github.com/<you>/tf-lab.git
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git push -u origin main
```

```examiner:execute-test
prefix: Check
description: Click to check this step
name: repo-ready
title: tf-lab is here, cloned from GitHub
```

---
title: "Step 4: make a tracked change"
---

Add a secondary NTP server:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  echo "ntp server 10.0.0.2" >> devices/core-sw01.cfg
```

`>>` appends to the file; a single `>` would overwrite it.

See exactly what changed:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git diff
```

Read it like a config compare (`show | compare` on Junos):

- `--- a/...` and `+++ b/...` name the old and the new version of the file.
- The `@@` line says where in the file the change sits.
- Lines starting with `+` were added, lines starting with `-` removed. The others are context.

`git diff` shows changes you haven't staged yet. Once they're staged, `git diff --staged` shows them. If the
output fills the screen and ends with `:`, press `q` to get your prompt back.

Stage and commit the change:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git add devices/core-sw01.cfg
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git commit -m "Add secondary NTP server to core-sw01"
```

```examiner:execute-test
prefix: Check
description: Click to check this step
name: ntp-commit
title: The secondary NTP server is committed
```

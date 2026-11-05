---
title: "Step 4: start the change on a branch and push it"
---

Prepare the change on its own branch, as you would a candidate config:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git switch -c change/add-snmp
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  echo "snmp-server community READONLY ro" >> devices/core-sw01.cfg
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git diff
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git commit -am "Add read-only SNMP community to core-sw01"
```

Push the branch. It doesn't exist on GitHub yet, so `-u` again:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git push -u origin change/add-snmp
```

GitHub answers with a link to *create a pull request* for the branch: that's step 5.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: branch-pushed
title: change/add-snmp is on GitHub
```

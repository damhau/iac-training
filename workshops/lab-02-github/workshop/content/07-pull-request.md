---
title: "Step 5: open a pull request"
---

A pull request asks to merge one branch into another, here `change/add-snmp` into `main`. It's your change
request: the diff, the discussion and the approval, in one place.

On GitHub, in `netops-lab`: the yellow *Compare & pull request* banner, or *Pull requests*, *New pull request*,
with base `main` and compare `change/add-snmp`.

- **Title:** `Add read-only SNMP community to core-sw01`
- **Description:** what and why, and on a line of its own `Closes #1`, with your issue's number.

`Closes #1` links the change to its ticket: merging the pull request closes the issue.

*Create pull request*. Look through its tabs: *Conversation*, *Commits*, *Files changed* (the diff).

```examiner:execute-test
prefix: Check
description: Click to check this step
name: pr-opened
title: A pull request into main closes the issue
```

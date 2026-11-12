---
title: "Step 5: merge, and watch the run on main"
---

Review the pull request as the CAB would: *Files changed*, the workflow and the `fmt` fix. Then *Merge pull
request*, *Confirm merge*. GitHub offers to *Delete branch*: you can, its change is in `main` now.

Open the **Actions** tab: a new run starts, for the merge. Its event is a push to `main`, not a pull request:
the same pre-checks, now on what was merged. That's where a gated apply goes, on the next page.

```examiner:execute-test
prefix: Check
description: Click when the run has finished
name: merged
title: Merged, and the run on main passed
```

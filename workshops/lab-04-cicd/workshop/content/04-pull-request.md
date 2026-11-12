---
title: "Step 2: open a pull request, and watch the checks"
---

On GitHub, in `tf-lab`: the yellow *Compare & pull request* banner, or *Pull requests*, *New pull request*,
with base `main` and compare `ci/add-pipeline`. The title is the commit's. *Create pull request*.

The workflow starts at once. At the bottom of the *Conversation* tab is its check,
*Terraform / validate-and-plan*, with a yellow dot while it runs. Open the **Checks** tab to watch it live: each
step in turn, and its log.

Once it is green, read the log: click a step to unfold it. *Plan* shows the same plan as Session 3's step 4,
`Plan: 3 to add, 0 to change, 0 to destroy.`

Every config is *to add*: the runner starts empty, with no state, so as far as it knows nothing exists yet. A
pipeline that applies needs its state kept somewhere that outlives the runner: the discussion comes back to it.

{{< note >}}
In the terminal, `gh pr checks --watch` follows the same checks, for the branch you're on.
{{< /note >}}

```examiner:execute-test
prefix: Check
description: Click to check this step
name: pr-opened
title: A pull request into main started the workflow
```

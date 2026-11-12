---
title: "Step 3: break the formatting, and watch CI fail"
---

A change that works, but breaks the house style. In `main.tf`, add two spaces in front of `for_each`, so that it
reads:

```hcl
resource "local_file" "config" {
    for_each = var.devices
```

In the Editor tab (save with `Ctrl+S`):

```editor:open-file
file: ~/exercises/tf-lab/main.tf
```

Or in nano: move with the arrow keys, save with `Ctrl+O` then Enter, quit with `Ctrl+X`.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: nano main.tf
```

`terraform fmt` leaves the text inside `<<-EOT` alone: that's the config, not HCL. Change an HCL line, like
`for_each`, not the config text.

The pipeline's first check, run here:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform fmt -check
```

It prints `main.tf`, the file that isn't formatted, and changes nothing. You could stop here, and should, on a
real change. Today, let CI catch it:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git commit -am "Indent for_each"
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git push
```

On the pull request, a red X: *Some checks were not successful*. *Details*, next to the check: *Format check*
failed, its log lists `main.tf`, and the steps after it didn't run: a change that fails a pre-check never gets
as far as the plan.

The *Merge pull request* button is still there: for now, a red check is a warning. Protecting `main`, as in
Session 2's stretch, can require the check to pass before a merge.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: ci-failed
title: CI failed on Format check
```

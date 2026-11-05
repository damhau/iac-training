---
title: "Step 4: add two devices declaratively"
---

Two more devices: you don't write their configs, you add them to the inventory. In `main.tf`, add two lines to
the `devices` map, so that it reads:

```hcl
  default = {
    core-sw01  = "10.0.0.11"
    edge-rtr01 = "10.0.0.21"
    edge-rtr02 = "10.0.0.22"
  }
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

The `=` signs don't line up? `terraform fmt` lines them up.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform plan
```

`Plan: 2 to add, 0 to change, 0 to destroy.`: the two new configs. `core-sw01` isn't listed: it already
matches.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform apply
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: ls configs/
```

{{< note >}}
The change goes into the file, not onto the command line. `terraform apply -var 'devices={...}'` would render
the same three files, but `main.tf` would still say one device: the next `terraform plan` without the same
`-var` falls back to the default, and plans to delete the two new configs. The file is the intent.
{{< /note >}}

```examiner:execute-test
prefix: Check
description: Click to check this step
name: devices-added
title: Three devices in main.tf, three configs rendered
```

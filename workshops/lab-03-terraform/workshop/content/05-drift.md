---
title: "Step 5: cause drift by hand, and let Terraform heal it"
---

Someone edits a device outside the process, and another config is lost:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  echo "ip route 0.0.0.0 0.0.0.0 192.0.2.1" >> configs/core-sw01.cfg
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: rm configs/edge-rtr02.cfg
```

The files no longer match the intent. Terraform detects both:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform plan
```

First `Note: Objects have changed outside of Terraform`: what it found on disk, compared with its state.
Then the plan to fix it: `Plan: 2 to add, 0 to change, 0 to destroy.`

Both files show as `+`, created. The local provider treats a file whose content no longer matches what it
wrote as missing, and writes it again.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform apply
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: cat configs/core-sw01.cfg
```

The hand-made route is gone, and `ls configs/` shows `edge-rtr02.cfg` again: back to the desired state. On a
network, the same loop finds the change someone made on the CLI at 3 am.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: drift-healed
title: Drift caused, and healed
```

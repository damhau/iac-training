---
title: "Step 6: inspect the state, then clean up"
---

Before you destroy: are the checks of steps 3 to 5 green? They need the configs this step deletes.

The state is Terraform's record of what it manages:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform state list
```

```text
local_file.config["core-sw01"]
local_file.config["edge-rtr01"]
local_file.config["edge-rtr02"]
```

One resource's details:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform state show 'local_file.config["core-sw01"]'
```

The state is a JSON file, `terraform.tfstate`, and holds every value in clear text, the config content
included:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: grep '"content"' terraform.tfstate
```

With real devices, that's passwords and keys: step 7 keeps it out of Git.

Now delete everything Terraform manages:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform destroy
```

The plan is all `-`: `Plan: 0 to add, 0 to change, 3 to destroy.` Type `yes`. Then
`Destroy complete! Resources: 3 destroyed.`, and `ls configs/` shows nothing. Terraform deletes only what is in
its state: a file it didn't create would stay.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: destroyed
title: Everything Terraform managed is destroyed
```

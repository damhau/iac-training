---
title: "Step 3: run the core workflow"
---

Five commands, the same in every Terraform project. First, download the provider:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform init
```

`Installing hashicorp/local v2.9...`, then `Terraform has been successfully initialized!`. The provider is in
`.terraform/`, and `.terraform.lock.hcl` records its exact version, so everyone who uses this project gets the
same.

Tidy the formatting, then check the syntax:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform fmt
```

`terraform fmt` prints the files it changed: none, `main.tf` is already tidy.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform validate
```

`Success! The configuration is valid.`

## Read the plan

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform plan
```

The dry-run. Nothing is written yet. Read it from the top:

- The symbols: `+` create, `~` update in place, `-` destroy, `-/+` destroy then create again (replace).
- `# local_file.config["core-sw01"] will be created`: one block per change, named after the resource and its
  `for_each` key. Below it, the file's content and name; `(known after apply)` marks values that only exist
  once the file is written.
- `Plan: 1 to add, 0 to change, 0 to destroy.`: the summary, the line to read first on a big change.
- `Changes to Outputs`: what `config_files` will be.

## Apply it

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform apply
```

Terraform shows the plan again and asks `Do you want to perform these actions?`. Type `yes`, then Enter.
Anything else cancels. Then `Apply complete! Resources: 1 added, 0 changed, 0 destroyed.`, and the output:

```text
config_files = [
  "./configs/core-sw01.cfg",
]
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: cat configs/core-sw01.cfg
```

```text
hostname core-sw01
interface mgmt0
 ip address 10.0.0.11 255.255.255.0
ntp server 10.0.0.1
```

Terraform also wrote `terraform.tfstate`: what it created, so the next plan can compare. Step 6 looks inside.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: applied
title: init, validate and apply have run, and core-sw01's config is rendered
```

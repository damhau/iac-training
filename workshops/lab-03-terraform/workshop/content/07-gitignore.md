---
title: "Step 7: keep state out of Git"
---

`tf-lab` goes into Git on the last page. First, list what must never go in:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  printf ".terraform/\n*.tfstate\n*.tfstate.*\n*.tfvars\nconfigs/\n" > .gitignore
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: cat .gitignore
```

- `.terraform/`: the downloaded provider. `terraform init` gets it again.
- `*.tfstate`, `*.tfstate.*`: the state and its backup, `terraform.tfstate.backup`. Clear-text values, and
  each machine's own.
- `*.tfvars`: variable values files, where secrets usually go.
- `configs/`: Terraform's output. The intent is `main.tf`; the rendered files can always be made again.

`main.tf` and `.terraform.lock.hcl` stay in: the intent, and the provider version it was tested with.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: gitignore
title: .gitignore keeps state, secrets and rendered files out of Git
```

---
title: "Step 1: create the project"
---

A Terraform project is a folder of `.tf` files. The terminal starts in `~/exercises`: create the folder there,
and move into it.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: mkdir tf-lab && cd tf-lab
```

The prompt now ends in `~/exercises/tf-lab`. Every `terraform` command in this lab runs from here: Terraform
works on the `.tf` files of the folder it runs in.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: project-created
title: tf-lab is there
```

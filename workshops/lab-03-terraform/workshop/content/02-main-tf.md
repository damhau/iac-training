---
title: "Step 2: write main.tf"
---

`main.tf` describes the result you want: one config file per device, in `configs/`. Paste this whole block
into the terminal, then press Enter:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  cat > main.tf <<'EOF'
  terraform {
    required_providers {
      local = { source = "hashicorp/local", version = "~> 2.9" }
    }
  }

  provider "local" {}

  variable "devices" {
    description = "Device name and management IP"
    type        = map(string)
    default = {
      core-sw01 = "10.0.0.11"
    }
  }

  variable "ntp_server" {
    type    = string
    default = "10.0.0.1"
  }

  resource "local_file" "config" {
    for_each = var.devices
    filename = "${path.module}/configs/${each.key}.cfg"
    content  = <<-EOT
      hostname ${each.key}
      interface mgmt0
       ip address ${each.value} 255.255.255.0
      ntp server ${var.ntp_server}
    EOT
  }

  output "config_files" {
    value = [for f in local_file.config : f.filename]
  }
  EOF
```

Open it in the Editor tab to read it:

```editor:open-file
file: ~/exercises/tf-lab/main.tf
```

- **`terraform`**: the provider this project needs, `hashicorp/local`, and which versions: `~> 2.9` means 2.9
  or a later 2.x.
- **`variable "devices"`**: the inventory, device name to management IP. `ntp_server` is a second input,
  shared by every device.
- **`resource "local_file" "config"`**: a file to manage. `for_each` makes one per device in the map;
  `each.key` is the device name, `each.value` its IP. The text between `<<-EOT` and `EOT` is the config,
  with `${...}` filled in.
- **`output "config_files"`**: a value Terraform prints after each apply: here, the files it wrote.

Nothing describes *how* to create, edit or delete a file. You declare the end state; Terraform works out the
steps.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: main-tf
title: main.tf declares the devices and their configs
```

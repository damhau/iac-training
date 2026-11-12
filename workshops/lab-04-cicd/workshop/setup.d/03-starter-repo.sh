#!/bin/bash

# Builds ~/starter/tf-lab.bundle: tf-lab as Lab 3's last page pushes it, for
# learners without their own on GitHub (02-your-repo). main.tf as after step
# 4, the .gitignore of step 7, and the lock file that terraform init 1.17.1
# writes for hashicorp/local 2.9.1, written out here so that building the
# bundle needs no network. A fixed author and date make the commit ID the
# same in every session.
#
# Runs at every container start: does nothing once the bundle exists.

set -euo pipefail

bundle=$HOME/starter/tf-lab.bundle

if [ -f "$bundle" ]; then
    exit 0
fi

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

git init -q -b main "$work/tf-lab"
cd "$work/tf-lab"

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
    core-sw01  = "10.0.0.11"
    edge-rtr01 = "10.0.0.21"
    edge-rtr02 = "10.0.0.22"
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

printf ".terraform/\n*.tfstate\n*.tfstate.*\n*.tfvars\nconfigs/\n" > .gitignore

cat > .terraform.lock.hcl <<'EOF'
# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/hashicorp/local" {
  version     = "2.9.1"
  constraints = "~> 2.9"
  hashes = [
    "h1:qGLHCuYSus+uHNnoEL4SuJqOs5yrNOcB7gnuHoVqizo=",
    "zh:25606c7a5e308144fb627f6e31611bb52ff72bb9ae2d27af39673ab1a6b3c1bf",
    "zh:2568c4ef4dab31821f6f7040af0d1a2aa2b9455b8d9cc546598b791b8ada34cd",
    "zh:25ac210f136042047975896e5e11fe6012425301c826d6b7ce22a49f96a1e0e8",
    "zh:55d3a7bf01eced8e1f259b548020ef1221c5687e0fe6b5b30f81ad0b4121ff12",
    "zh:6168d6934777b853c57815baa18a54101c604a6f1124ca47cd23d016c6f2f1e5",
    "zh:63c0aa17c8373f761123376226debffd1f2259901ff259d4547c520def9a6787",
    "zh:6d1f1572db6c85bd6d6b1b1deef247084e189816875f67e6bcc5d4736794e0a9",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:a8ea1c155bd5e0d695a28d3c0e2f542de8844e1791ea021f015a3f08e1c059e1",
    "zh:ccd790f97269509ade0574ef63c955d3943cb1d812c59177bd85ce4c1d17ca0f",
    "zh:dcfc17bb666e659a9daa9ff52fd8f6ec9ea519868726015e645955c372296332",
    "zh:eb83abbfa7f52cba609b48cbb9a6a5cab07780a672b2020fc2ba190e699a2516",
    "zh:eedffca70074ae153790fb23c4ace8d1637a60ceba4e3c42c8eaeda7c1f9d10f",
  ]
}
EOF

git add .
GIT_AUTHOR_NAME="IaC training" GIT_AUTHOR_EMAIL="training@example.com" \
    GIT_COMMITTER_NAME="IaC training" GIT_COMMITTER_EMAIL="training@example.com" \
    GIT_AUTHOR_DATE="2026-01-05T09:00:00+0100" GIT_COMMITTER_DATE="2026-01-05T09:00:00+0100" \
    git commit -q -m "Render device configs with Terraform"

mkdir -p "$(dirname "$bundle")"
git bundle create -q "$bundle" --all

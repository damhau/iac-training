---
title: "Second hour: stretch and homework"
---

Step 6 destroyed the configs. Bring them back first: the same intent, applied again.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform apply
```

## Change the intent in one place

In `main.tf`, set the `ntp_server` default to `10.0.0.2`, then:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform plan
```

Every device config shows as `-/+`, replaced, the changed line marked `# forces replacement`: one edit, and
the plan lists every device it touches. `Plan: 3 to add, 0 to change, 3 to destroy.` (The local provider can't
edit a file in place, so a change is a replacement.) Apply it.

## A golden config template

Move the config text out of `main.tf`, into a template file. That file is your golden config:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  cat > device.cfg.tftpl <<'EOF'
  hostname ${hostname}
  interface mgmt0
   ip address ${mgmt_ip} 255.255.255.0
  ntp server ${ntp_server}
  EOF
```

In `main.tf`, replace the `content` argument, from `content  = <<-EOT` to the `EOT` line, with:

```hcl
  content = templatefile("${path.module}/device.cfg.tftpl", {
    hostname   = each.key
    mgmt_ip    = each.value
    ntp_server = var.ntp_server
  })
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform fmt
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: terraform plan
```

`No changes. Your infrastructure matches the configuration.`: the template renders the same text, so the plan
proves the refactoring changed nothing on the devices. A diff in the plan would mean the template differs.

## The certification

Read the [Terraform Associate (004) objectives](https://developer.hashicorp.com/terraform/tutorials/certification-004)
and rate yourself on each.

## Required for Session 4

`tf-lab` on GitHub: the next page.

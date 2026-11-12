---
title: Done when
---

These checks rerun on their own when the page opens:

```examiner:execute-test
prefix: Check
name: workflow-pushed
title: a workflow YAML written
autostart: true
```

```examiner:execute-test
prefix: Check
name: pr-opened
title: triggered on a pull request
autostart: true
```

```examiner:execute-test
prefix: Check
name: ci-failed
title: CI failed...
autostart: true
```

```examiner:execute-test
prefix: Check
name: ci-passed
title: ...then fixed
autostart: true
```

```examiner:execute-test
prefix: Check
name: merged
title: the merge started the run on main
autostart: true
```

And two no check can see:

- **CI logs read:** the *Plan* of step 2, the *Format check* of step 3.
- **The gated-apply pattern explained:** take the discussion's `apply` job and explain each line to your
  partner.

A red one? Go back to its step; this prints the reason:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: tail -n 1 ~/.local/share/workshop/examiner-scripts.log
```

## Where to go next

- **Certify:** [Terraform Associate (004)](https://developer.hashicorp.com/terraform/tutorials/certification-004).
- **Git:** rebase, interactive rebase, tags and releases, `git bisect`.
- **Terraform:** modules, remote state and locking, workspaces, `for_each` and `dynamic` blocks.
- **CI/CD:** matrix builds, reusable workflows, environments and approvals, secret scanning, OIDC authentication
  to the cloud (no long-lived secrets).
- **Your domain:** Terraform providers for Cloudflare, F5 BIG-IP, Cisco, AWS and Azure networking, DNS. Manage
  your network as code, starting with our SASE repository in Session 5.

## Sign out

The session, and the GitHub sign-in stored on it, are deleted when it ends. To sign out now:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: gh auth logout
```

As in Sessions 2 and 3: that removes the sign-in from this machine only. To revoke it, on GitHub: *Settings*,
*Applications*, *Authorized OAuth Apps*, **GitHub CLI**, *Revoke*. That signs out every `gh` you use, your
laptop's too.

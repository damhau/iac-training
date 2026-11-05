---
title: Done when
---

These checks rerun on their own when the page opens:

```examiner:execute-test
prefix: Check
name: applied
title: init, plan, apply; an output used
autostart: true
```

```examiner:execute-test
prefix: Check
name: devices-added
title: a variable used
autostart: true
```

```examiner:execute-test
prefix: Check
name: drift-healed
title: drift caused and healed
autostart: true
```

```examiner:execute-test
prefix: Check
name: destroyed
title: destroy
autostart: true
```

```examiner:execute-test
prefix: Check
name: gitignore
title: state kept out of Git
autostart: true
```

```examiner:execute-test
prefix: Check
name: pushed
title: "required for Session 4: tf-lab on GitHub"
autostart: true
```

And two no check can see:

- **A plan read and explained:** take one of your plans, step 4's or the stretch's `-/+`, and explain each
  line to your partner.
- **State inspected:** `terraform state list` and `terraform state show`, step 6.

A red one? Go back to its step; this prints the reason:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: tail -n 1 ~/.local/share/workshop/examiner-scripts.log
```

A step 3 to 5 check red after the destroy, because it wasn't clicked before? `terraform apply` brings the
configs back; for step 5, cause the drift again.

## Sign out

The session, and the GitHub sign-in stored on it, are deleted when it ends. To sign out now:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: gh auth logout
```

As in Session 2: that removes the sign-in from this machine only. To revoke it, on GitHub: *Settings*,
*Applications*, *Authorized OAuth Apps*, **GitHub CLI**, *Revoke*. That signs out every `gh` you use, your
laptop's too.

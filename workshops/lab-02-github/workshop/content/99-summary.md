---
title: Done when
---

These checks rerun on their own when the page opens:

```examiner:execute-test
prefix: Check
name: pushed
title: pushed to a remote
autostart: true
```

```examiner:execute-test
prefix: Check
name: gh-signed-in
title: gh sign-in works
autostart: true
```

```examiner:execute-test
prefix: Check
name: pr-opened
title: pull request opened, linked to an issue
autostart: true
```

```examiner:execute-test
prefix: Check
name: reviewed
title: reviewed
autostart: true
```

```examiner:execute-test
prefix: Check
name: merged
title: merged
autostart: true
```

```examiner:execute-test
prefix: Check
name: pulled
title: merged change pulled down
autostart: true
```

A red one? Go back to its step; this prints the reason:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: tail -n 1 ~/.local/share/workshop/examiner-scripts.log
```

## Your repository

It's on GitHub: nothing to download. On your laptop, `git clone https://github.com/<you>/netops-lab.git`.

## Sign out

The session, and the sign-in stored on it, are deleted when it ends. To sign out now:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: gh auth logout
```

That removes the sign-in from this machine, but GitHub still accepts it until it is revoked. To revoke it: on
GitHub, *Settings*, *Applications*, *Authorized OAuth Apps*, **GitHub CLI**, *Revoke*. That signs out every
`gh` you use, your laptop's too: skip it if you use `gh` there.

---
title: "Before you start: your repo"
---

This session is a fresh machine, as Session 1's was. Tell Git who you are again. This time use the e-mail of
your GitHub account: GitHub links your commits to your profile by it.

```workshop:copy-and-edit
prefix: Copy
title: click, paste, then put your own value between the quotes
text: git config --global user.name "Your Name"
```

```workshop:copy-and-edit
prefix: Copy
title: click, paste, then put your own value between the quotes
text: git config --global user.email "you@example.com"
```

```examiner:execute-test
prefix: Check
description: Click to check this step
name: git-identity
title: Git knows your name and e-mail
```

## Bring netops-lab

Kept `netops-lab.bundle` from the end of Session 1? Upload it:

```files:upload-file
prefix: Upload
title: your netops-lab.bundle from Session 1
path: netops-lab.bundle
```

Then turn it back into a repository, in `~/exercises`:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: cd ~/exercises
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git clone ~/uploads/netops-lab.bundle netops-lab
```

No bundle? This session has netops-lab as Session 1 leaves it. Clone that one instead:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git clone ~/starter/netops-lab.bundle netops-lab
```

Either way, the clone remembers the bundle file as its `origin`, the place it came from. GitHub becomes
`origin` in step 2, so drop that one:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: cd netops-lab
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git remote remove origin
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git log --oneline --graph
```

That's Session 1's history: the merge, then the revert on top.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: repo-ready
title: netops-lab is here, with its history
```

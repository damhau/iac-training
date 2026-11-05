---
title: "Step 0: tell Git who you are"
---

Every commit records who made it, like the user in a device's commit history. On your laptop you set this
once; this session is a fresh machine.

Put your own name and e-mail between the quotes, then run each line:

```workshop:copy-and-edit
text: git config --global user.name "Your Name"
```

```workshop:copy-and-edit
text: git config --global user.email "you@example.com"
```

The session has already set two more options, so that Git's output matches these instructions:

```workshop:copy
text: git config --global --list
```

- `init.defaultBranch=main`: new repositories start on a branch named `main` (older Git used `master`).
- `core.editor=nano`: the editor Git opens when it needs a message from you, in step 8.

```examiner:execute-test
name: git-identity
title: Git knows your name and e-mail
```

---
title: "Before you start: sign in to GitHub"
---

This session is a fresh machine. As in Sessions 2 and 3, the e-mail of your GitHub account:

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

Sign in to GitHub as in Session 2, with one addition at the end, `--scopes workflow`:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: gh auth login --hostname github.com --git-protocol https --web --scopes workflow
```

Press Enter for yes to *Authenticate Git with your GitHub credentials?*, then open
[github.com/login/device](https://github.com/login/device) and type the code gh shows.

`--scopes workflow` lets this sign-in change the files in `.github/workflows/`, where the pipeline goes. A
pipeline runs code on GitHub's machines, with access to the repository and its secrets, so GitHub makes that a
permission of its own, and refuses the push without it.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: gh-signed-in
title: Signed in to GitHub, allowed to push a workflow
```

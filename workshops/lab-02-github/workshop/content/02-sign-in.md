---
title: "Before you start: sign in to GitHub"
---

`git push` to GitHub needs to know it's you. On your laptop you can add an SSH key to your GitHub account (the
second hour shows how). Here you use the GitHub CLI, `gh`: one command, then a code you type on github.com.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: gh auth login --hostname github.com --git-protocol https --web
```

1. *Authenticate Git with your GitHub credentials?* Press Enter, for yes: `git push` then signs in through
   `gh`, with no password to type.
2. gh shows a one-time code, like `ABCD-1234`, and asks you to press Enter to open a browser. Press Enter: it
   can't open one from this machine, and says so.
3. Open [github.com/login/device](https://github.com/login/device) yourself, in a new tab. Type the code, then
   authorize **GitHub CLI**.

The terminal finishes with `Logged in as <you>`. Confirm:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: gh auth status
```

{{< note >}}
The sign-in gives `gh` access to all your repositories (the `repo` scope): pushing needs it. It is stored on
this machine, which is deleted with the session. The last page shows how to sign out and revoke it.
{{< /note >}}

```examiner:execute-test
prefix: Check
description: Click to check this step
name: gh-signed-in
title: Signed in to GitHub
```

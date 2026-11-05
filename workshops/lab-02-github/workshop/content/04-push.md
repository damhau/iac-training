---
title: "Step 2: connect your repo and push it"
---

Add your GitHub repository as a remote named `origin`, the conventional name for "the shared copy". Put your
GitHub username in place of `<you>`:

```workshop:copy-and-edit
prefix: Copy
title: click, paste, then put your GitHub username in place of <you>
text: git remote add origin https://github.com/<you>/netops-lab.git
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git remote -v
```

Push `main` to it:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git push -u origin main
```

`-u` makes GitHub's `main` the upstream of yours: from now on a plain `git push` or `git pull` on `main` knows
where to go, and `git status` compares with it.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git status
```

Reload your repository page on GitHub: the configs are there, and *commits* lists your whole history.

{{< note >}}
Push refused with `rejected ... (fetch first)`? The repository on GitHub isn't empty: it was created with a
README or a licence. Delete it (its *Settings*, at the bottom), create it again empty, and push again.
{{< /note >}}

```examiner:execute-test
prefix: Check
description: Click to check this step
name: pushed
title: main is on GitHub
```

---
title: "Before Session 4: tf-lab on GitHub"
---

Required for Session 4: `tf-lab` in a public GitHub repository, also named `tf-lab`. This session is deleted
when it ends; GitHub keeps it.

## Name, e-mail, sign-in

This session is a fresh machine. As in Session 2, the e-mail of your GitHub account:

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

Sign in to GitHub as in Session 2: press Enter for yes to *Authenticate Git with your GitHub credentials?*,
then open [github.com/login/device](https://github.com/login/device) and type the code gh shows.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: gh auth login --hostname github.com --git-protocol https --web
```

```examiner:execute-test
prefix: Check
description: Click to check this step
name: gh-signed-in
title: Signed in to GitHub
```

## Commit and push

On GitHub, create a new repository: `tf-lab`, **public**, **empty** (no README, `.gitignore` or licence).

Then in the terminal:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: cd ~/exercises/tf-lab
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git init
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git add .
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git status
```

Read the list before committing: `.gitignore`, `.terraform.lock.hcl` and `main.tf`, plus `device.cfg.tftpl` if
you did the template. No `terraform.tfstate`, nothing under `.terraform/` or `configs/`. Something there that
shouldn't be? Fix `.gitignore` (step 7), then `git rm -r --cached .` and `git add .` again.

The lock file goes in: it pins the provider version, so Session 4 gets the same.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git commit -m "Render device configs with Terraform"
```

```workshop:copy-and-edit
prefix: Copy
title: click, paste, then put your GitHub username in place of <you>
text: git remote add origin https://github.com/<you>/tf-lab.git
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git push -u origin main
```

Reload the repository page on GitHub: the files are there, and no state.

```examiner:execute-test
prefix: Check
description: Click to check this step
name: pushed
title: tf-lab is on GitHub, without its state
```

{{< note >}}
On your laptop, as Session 2's homework: `git remote add origin git@github.com:<you>/tf-lab.git`, with your SSH
key.
{{< /note >}}

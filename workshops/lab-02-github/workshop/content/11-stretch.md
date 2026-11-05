---
title: "Second hour: stretch and homework"
---

## Two pull requests, one line

Two changes to the same line, proposed at the same time: the second has to be reconciled with the first.

**In pairs,** use partner A's repository. A adds B as a collaborator first (*Settings*, *Collaborators*), so B
can push branches to it. B clones it, in `~/exercises`:

```workshop:copy-and-edit
prefix: Copy
title: click, paste, then put your partner's GitHub username in place of <partner>
text: git clone https://github.com/<partner>/netops-lab.git partner-lab
```

**Alone,** clone your own repository a second time and play both roles, one per folder:

```workshop:copy-and-edit
prefix: Copy
title: click, paste, then put your GitHub username in place of <you>
text: git clone https://github.com/<you>/netops-lab.git netops-lab-2
```

Then, in each of the two folders, a branch that changes the syslog target, each to a different address:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git switch -c change/syslog-a
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  sed -i 's/^logging host .*/logging host 10.0.0.60/' devices/core-sw01.cfg
```

In the other folder, `change/syslog-b` and `10.0.0.70`. Commit, push with `-u`, and open a pull request for
each. Merge the first. The second now shows *This branch has conflicts that must be resolved*. On its branch:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git pull origin main
```

The same conflict as in Session 1. Keep the address you agree on, `git add` the file, `git commit`, `git push`:
the pull request updates itself, and can be merged.

## A real README

Write `README.md` for `netops-lab`: what it is, how it is structured. Go through a pull request, as for any
change: a branch, the file (in the **Editor** tab, or nano), a commit, a push, a pull request, a merge.

## Protect main

Make the review compulsory. In the repository's *Settings*, *Branches* (or *Rules*, *Rulesets*): protect `main`
and require a pull request with one approval before merging. An approval only counts from someone with write
access: add your partner as a collaborator first. Then try `git push` straight to `main`: GitHub refuses it.

## GitHub Skills

Do [Introduction to GitHub](https://github.com/skills/introduction-to-github) in the browser: a guided course,
run in a repository of your own.

## Homework: SSH on your laptop

On your own machine, an SSH key is the usual way to sign in for `git push`. Create one, and add its public part
to GitHub (*Settings*, *SSH and GPG keys*):

```bash
ssh-keygen -t ed25519 -C "you@example.com"
cat ~/.ssh/id_ed25519.pub           # copy this into GitHub
ssh -T git@github.com               # "Hi <you>! You've successfully authenticated..."
```

Then clone with the SSH address, `git@github.com:<you>/netops-lab.git`. HTTPS with a personal access token, or
`gh auth login` as here, also work. Never put credentials in a repo.

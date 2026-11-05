---
title: Done when
---

These checks rerun on their own when the page opens:

```examiner:execute-test
prefix: Check
name: repo-initialised
title: init
autostart: true
```

```examiner:execute-test
prefix: Check
name: first-commit
title: stage and commit
autostart: true
```

```examiner:execute-test
prefix: Check
name: ntp-commit
title: read a diff, then commit it
autostart: true
```

```examiner:execute-test
prefix: Check
name: syslog-branch
title: branch
autostart: true
```

```examiner:execute-test
prefix: Check
name: merge-resolved
title: trigger and resolve a conflict
autostart: true
```

```examiner:execute-test
prefix: Check
name: reverted
title: revert
autostart: true
```

A red one? Go back to its step; this prints the reason:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: tail -n 1 ~/.local/share/workshop/examiner-scripts.log
```

## Keep your repository

This session is deleted when it ends. Pack the whole repository, history included, into one file:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git bundle create ~/exercises/netops-lab.bundle --all
```

Then download it:

```files:download-file
path: netops-lab.bundle
```

On your laptop, turn it back into a repository:

```bash
git clone netops-lab.bundle netops-lab
cd netops-lab
git remote remove origin    # the clone points at the bundle file; Session 2 adds GitHub as origin
```

In Session 2 you push `netops-lab` to GitHub and propose a change through a pull request.

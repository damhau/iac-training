---
title: "Step 8: practise rollback"
---

A bad change reaches `main`: someone removes the primary NTP server.

```workshop:copy
text: |-
  echo "no ntp server 10.0.0.1" >> devices/core-sw01.cfg
```

```workshop:copy
text: git commit -am "Remove primary NTP server from core-sw01"
```

```workshop:copy
text: git log --oneline
```

Roll it back. `git revert` doesn't erase anything: it adds a new commit that does the opposite of the one you
name. On a shared branch that is the safe undo, like a rollback change with its own record.

```workshop:copy
text: git revert HEAD
```

`HEAD` is the commit you're on: the bad one. Git opens nano with a ready message,
`Revert "Remove primary NTP server from core-sw01"`. Keep it and press `Ctrl+X`: Git makes the commit when
nano closes.

```workshop:copy
text: git log --oneline
```

```workshop:copy
text: cat devices/core-sw01.cfg
```

The bad line is gone, and both the bad commit and its revert stay in the history.

Emptied the message by mistake? Git then says `Aborting commit due to empty commit message` but leaves the
revert staged, and a second `git revert` refuses to run. Unstage and discard it, then revert again:

```workshop:copy
text: git restore --staged --worktree devices/core-sw01.cfg
```

{{< note >}}
Why make a new bad commit instead of undoing step 7? Right after the merge, `git revert HEAD` would try to undo
the merge commit, and Git refuses that without the extra `-m` option, which says which parent to go back to.
{{< /note >}}

```examiner:execute-test
name: reverted
title: The bad change is reverted
```

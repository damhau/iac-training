---
title: "Step 7: merge and resolve the conflict"
---

Bring the feature branch into `main`:

```workshop:copy
text: git merge feature/add-syslog
```

Git stops with `CONFLICT (content): Merge conflict in devices/core-sw01.cfg`. Both branches changed the same
line, and Git won't guess which syslog target is right. The prompt shows `(main|MERGING)`.

```workshop:copy
text: git status
```

The file now looks like this:

```text
hostname core-sw01
ntp server 10.0.0.1
ntp server 10.0.0.2
<<<<<<< HEAD
logging host 10.0.0.99
=======
logging host 10.0.0.50
>>>>>>> feature/add-syslog
```

Between `<<<<<<< HEAD` and `=======` is the branch you're on (`main`); between `=======` and
`>>>>>>> feature/add-syslog`, the branch coming in. The agreed target is 10.0.0.50: keep that line, and
delete the 10.0.0.99 line and the three marker lines.

Edit the file in nano:

```workshop:copy
text: nano devices/core-sw01.cfg
```

In nano, move with the arrow keys, cut a whole line with `Ctrl+K`, save with `Ctrl+O` then Enter, and quit
with `Ctrl+X`.

{{< warning >}}
Avoid `Ctrl+W` (nano's search): your browser may take it as "close tab".
{{< /warning >}}

Or open it in the Editor tab, which offers *Accept Current Change* and *Accept Incoming Change* above the
conflict:

```editor:open-file
file: ~/exercises/netops-lab/devices/core-sw01.cfg
```

Either way, the file must end up as:

```text
hostname core-sw01
ntp server 10.0.0.1
ntp server 10.0.0.2
logging host 10.0.0.50
```

Mark the file resolved, and conclude the merge with its own commit:

```workshop:copy
text: git add devices/core-sw01.cfg
```

```workshop:copy
text: git commit -m "Merge syslog change, keep 10.0.0.50 as agreed"
```

```workshop:copy
text: git log --oneline --graph --all
```

The two lines of history join again at the merge commit.

{{< note >}}
Lost in the middle of the merge? `git merge --abort` puts `main` back as it was before `git merge`. Then start
this step again.
{{< /note >}}

```examiner:execute-test
name: merge-resolved
title: The conflict is resolved and main keeps 10.0.0.50
```

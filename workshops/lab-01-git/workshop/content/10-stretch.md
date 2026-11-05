---
title: "Second hour: stretch and homework"
---

## Learn Git Branching

Play [Learn Git Branching](https://learngitbranching.js.org) levels 1–4 (it opens in a new tab), then redo
them from memory.

## Unstage, then discard

Make a change and stage it:

```workshop:copy
text: |-
  echo "snmp-server community public ro" >> devices/edge-rtr01.cfg
```

```workshop:copy
text: git add devices/edge-rtr01.cfg
```

```workshop:copy
text: git status
```

It's in the candidate, under "Changes to be committed". Take it out again without losing the edit:

```workshop:copy
text: git restore --staged devices/edge-rtr01.cfg
```

`git status` now lists it under "Changes not staged for commit": the edit is still in the file. Discard the
edit itself:

```workshop:copy
text: git restore devices/edge-rtr01.cfg
```

```workshop:copy
text: git status
```

{{< warning >}}
`git restore <file>` throws away uncommitted edits for good: Git never saved them, so it can't give them back.
{{< /warning >}}

## Your history as a graph

```workshop:copy
text: git log --oneline --graph --all
```

Find your two branches, where they forked in step 6, the merge commit from step 7, and the revert from step 8.

## Homework

Put a real, non-sensitive folder you own under Git on your laptop: a scripts folder, a docs folder. Run the
same loop: `git init`, `git add`, `git commit`, then change something and read `git diff` before committing.

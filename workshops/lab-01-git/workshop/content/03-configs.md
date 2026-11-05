---
title: "Step 2: create some \"configs\""
---

Two mock device configs, in a `devices` folder:

```workshop:copy
text: mkdir devices
```

```workshop:copy
text: |-
  printf "hostname core-sw01\nntp server 10.0.0.1\n" > devices/core-sw01.cfg
```

```workshop:copy
text: |-
  printf "hostname edge-rtr01\n" > devices/edge-rtr01.cfg
```

And a list of files Git must never track:

```workshop:copy
text: |-
  echo "*.log" > .gitignore
```

`.gitignore` keeps any `*.log` file out of the repository, the way you would keep session captures out of a
config backup.

Look at what you created:

```workshop:copy
text: cat devices/core-sw01.cfg
```

Nothing is versioned yet: Git only sees these files. The next step saves them.

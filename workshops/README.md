# Workshops

The hands-on labs, as [Educates](https://docs.educates.dev) workshops. Each runs in a browser: instructions,
a Linux terminal and VS Code, in a session of its own on the hetzner-talos cluster.

| Lab | Folder | Portal |
| --- | --- | --- |
| Lab 1: version your network configs (Git) | [`lab-01-git`](lab-01-git) | `hv-iac` |

Learners open the portal at <https://hv-iac-ui.edu.dhconsulting.ch>, enter the event access code, and pick a
lab.

## How it is deployed

Two repositories, one Argo CD Application (`educates-portal-iac` in
[k8s-argocd](https://github.com/damhau/k8s-argocd)):

- **here**, [`kustomization.yaml`](kustomization.yaml): the `Workshop` definitions, one
  `<lab>/resources/workshop.yaml` per lab.
- **k8s-argocd**, `base/training/portals/iac`: the `TrainingPortal` that lists the labs, and its access code
  and admin password, from the Key Vault.

Each new session downloads its lab folder from `main` of this repository (`spec.workshop.files`). So:

- a pushed change to a lab's instructions, setup or checks reaches the **next session started**; sessions
  already running keep their copy;
- a pushed change to a lab's `resources/workshop.yaml` makes the portal **replace the workshop environment**
  (`portal.updates.workshop`): running sessions finish on the old one, new ones start on the new.

Write access to this repository is write access to the cluster. A `Workshop` can create objects at session
start, with the Educates operator's permissions, and Argo CD applies whatever is on `main`. Review it like
k8s-argocd.

## Layout of a lab

```text
lab-01-git/
  resources/workshop.yaml   the Workshop definition: image, files, editor, examiner, ...
  workshop/
    config.yaml             page order (Hugo renderer)
    content/*.md            the instructions, one page per step
    setup.d/*.sh            run as the learner when the session starts
    profile                 sourced by every terminal (the prompt)
    examiner/lib.sh         shared by the checks
    examiner/tests/*        the checks the "check" blocks run: exit 0 = passed
  exercises/                the learner's working folder: the terminal and the editor open here
```

## Writing the instructions

Pages are Markdown, with fenced blocks that become actions:

````markdown
```workshop:copy
text: git status
```

```workshop:copy-and-edit
text: git config --global user.name "Your Name"
```

```examiner:execute-test
name: first-commit
title: The baseline is committed
```
````

Learners type, or copy, every command they are learning; clickable actions are kept to the checks, opening a
file in the editor, and downloads. Reference:
[workshop instructions](https://docs.educates.dev/en/latest/workshop-content/workshop-instructions.html).

## Writing a check

A check is an executable in `workshop/examiner/tests/`: exit 0 and it turns green. It runs in the learner's
home directory, with a 15 second timeout. Mark it executable before committing (`chmod +x`); git keeps the
mode.

The dashboard only shows passed or failed. What the check prints goes to
`~/.local/share/workshop/examiner-scripts.log`, so print the reason and the fix in one line; the pages tell
learners to read it with `tail -n 1`.

Check committed history rather than the working tree where you can, so a check still passes once the learner
has moved on. The last page of a lab reruns them all.

## Testing a change

1. Push to `main`.
2. Start a new session from the portal (end your current one first: one session per learner).
3. In a session already running, `update-workshop` in the terminal pulls the latest files instead; reload the
   instructions with Shift held on the reload icon.

The checks can also run without a session: copy `workshop/` into a scratch `$HOME`, play the steps, and run
each test from that `$HOME`.

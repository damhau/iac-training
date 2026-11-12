---
title: "Second hour: stretch"
---

## A real apply, behind an approval

The `apply` job of the discussion, without the `env` lines: `tf-lab` needs no secret.

First the gate. On GitHub, in `tf-lab`: *Settings*, *Environments*, *New environment*, named `production`. Tick
*Required reviewers*, add yourself, *Save protection rules*. Do it before the merge: a job naming an environment
that doesn't exist creates it, with no reviewers, and applies at once.

Then, from an up-to-date `main`:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git switch main
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git pull
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git switch -c ci/add-apply
```

Add the job at the end of the workflow, with a last step that keeps the configs it renders. Paste the whole
block:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  cat >> .github/workflows/terraform.yml <<'EOF'

    apply:
      needs: validate-and-plan
      if: github.ref == 'refs/heads/main'
      runs-on: ubuntu-latest
      environment: production
      steps:
        - uses: actions/checkout@v7
        - uses: hashicorp/setup-terraform@v4
        - run: terraform init
        - run: terraform apply -auto-approve -input=false
        - uses: actions/upload-artifact@v7
          with:
            name: configs
            path: configs/
  EOF
```

```editor:open-file
file: ~/exercises/tf-lab/.github/workflows/terraform.yml
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: 'git commit -am "Add CI: apply on main, gated on production"'
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git push -u origin ci/add-apply
```

Open a pull request: *validate-and-plan* runs, and *apply* is skipped, since this isn't `main`. Merge it.

In the **Actions** tab, the run for the merge: *validate-and-plan* passes, then *apply* waits for review.
*Review deployments*, tick `production`, *Approve and deploy*. Once the apply has run, the configs are under
**Artifacts**, at the bottom of the run's page: `configs`, a zip of the three `.cfg` files.

## Automate Terraform with GitHub Actions

Follow [Automate Terraform with GitHub Actions](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions):
it adds a remote backend and posts the plan as a comment on the pull request.

## GitHub Skills

Do a GitHub Skills Actions course, such as "Hello GitHub Actions", at [skills.github.com](https://skills.github.com).

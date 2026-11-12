---
title: "Step 1: add the workflow on a branch"
---

The pipeline is a file in the repository: a GitHub Actions workflow, in `.github/workflows/`. It goes in like
any change, on a branch, through a pull request.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git switch -c ci/add-pipeline
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: mkdir -p .github/workflows
```

Paste this whole block into the terminal, then press Enter:

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: |-
  cat > .github/workflows/terraform.yml <<'EOF'
  name: Terraform

  on:
    pull_request:
      branches: [ main ]
    push:
      branches: [ main ]

  jobs:
    validate-and-plan:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v7

        - uses: hashicorp/setup-terraform@v4

        - name: Format check
          run: terraform fmt -check

        - name: Init (no backend for the lab)
          run: terraform init -backend=false

        - name: Validate
          run: terraform validate

        - name: Plan
          run: terraform plan -input=false
          # The local provider needs no credentials, so the plan runs on any runner.
          # A real apply goes in a separate job, gated on push to main and an approval.
  EOF
```

Open it in the Editor tab to read it:

```editor:open-file
file: ~/exercises/tf-lab/.github/workflows/terraform.yml
```

- **`on`**: when it runs. On every pull request into `main`, and on every push to `main`, which is what a
  merge is.
- **`jobs`**: one job, `validate-and-plan`, on `ubuntu-latest`: a fresh machine GitHub starts for each run, the
  *runner*, and deletes after it.
- **`steps`**: run in order; the first that fails stops the job. `actions/checkout` copies the repository onto
  the runner, `hashicorp/setup-terraform` installs Terraform. Then Session 3's commands:
  - `terraform fmt -check` changes nothing: it fails if a file isn't formatted.
  - `terraform init -backend=false` downloads the provider, and skips the backend, where a real project keeps
    its state.
  - `terraform validate`, then `terraform plan`. `-input=false`: nobody is there to answer a question.

The pre-checks you ran by hand in Session 3, now run on every proposed change, in the same order, every time.

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git add .github/workflows/terraform.yml
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: 'git commit -m "Add CI: terraform fmt/validate/plan on PR"'
```

```workshop:copy
prefix: Copy
title: click, then paste into the terminal
text: git push -u origin ci/add-pipeline
```

{{< note >}}
`refusing to allow an OAuth App to create or update workflow`? The sign-in has no `--scopes workflow`. Add it
with `gh auth refresh --hostname github.com --scopes workflow`, and the code on github.com, then push again.
{{< /note >}}

```examiner:execute-test
prefix: Check
description: Click to check this step
name: workflow-pushed
title: The workflow is on GitHub
```

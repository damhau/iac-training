---
title: "Discussion: the gated apply"
---

CI now runs the pre-checks and the dry-run. The other half of the change window is the apply, after approval.

How would you add a gated apply job? Try to answer before you read on.

## Answer

A second job that runs only on `main` (`if: github.ref == 'refs/heads/main'`), using a GitHub environment with
required reviewers, and with the provider credentials stored as secrets:

```yaml
  apply:
    needs: validate-and-plan
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    environment: production          # Settings, Environments: add required reviewers
    steps:
      - uses: actions/checkout@v7
      - uses: hashicorp/setup-terraform@v4
      - run: terraform init
      - run: terraform apply -auto-approve -input=false
        env:
          TF_VAR_api_token: ${{ secrets.API_TOKEN }}
```

- **`needs`**: only once the pre-checks have passed.
- **`if`**: only after the merge. On a pull request, the job is skipped.
- **`environment`**: the gate. The job waits until one of the environment's required reviewers approves it.
- **`secrets.API_TOKEN`**: the credential, stored in GitHub, never in the repository, and masked in the logs.
  `TF_VAR_api_token` hands it to Terraform as the variable `api_token`.

`tf-lab` needs no secret: the `env` lines show where a cloud or network API token goes. For real use, the state
must live in a remote backend: a fresh runner keeps nothing between runs.

# terraform-github-check-action

Creates a GitHub check displaying a Terraform plan.

## Usage

```
jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - uses: TakeScoop/terraform-cloud-workspace-action
        name: Manage Terraform Workspaces
        id: terraform
        with:
          terraform_token: "${{ secrets.TF_TOKEN }}"
          terraform_organization: org 
          apply: "${{ github.event.inputs.apply == 'true' || github.ref == format('refs/heads/{0}', github.event.repository.default_branch) }}"
      - uses: TakeScoop/terraform-github-check-action
        name: Create GitHub Check
        with:
          github_token: "${{ secrets.GH_TOKEN }}"
          name: Terraform Cloud Workspace
          plan: "${{ steps.terraform.outputs.plan }}"
```

## Inputs

| Name | Description | Default |
| --- | --- | --- |
| `github_token` | GitHub token with permission to post GitHub checks. | |
| `name` | GitHub check name. | |
| `plan` | Human readable Terraform plan. | |

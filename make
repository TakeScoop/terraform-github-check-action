foo=$(cat << EOF
followingb
bar
baz
EOF
)

echo foo: $foo




jq --null-input '{
  "title": "Terraform Cloud Workspace Plan",
  "summary": "Changes planned for Terraform Cloud Workspace"
}' | jq -cM --arg plan "
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # tfe_variable.golden-gate-production-TF_VAR_environment will be updated in-place
  ~ resource "tfe_variable" "golden-gate-production-TF_VAR_environment" {
      - description  = "The environment the workspace provisions (automatically set to the name suffix)" -> null
        id           = "var-MGd9dTWtdFQhtPrY"
        # (6 unchanged attributes hidden)
    }

  # tfe_variable.golden-gate-staging-TF_VAR_environment will be updated in-place
  ~ resource "tfe_variable" "golden-gate-staging-TF_VAR_environment" {
      - description  = "The environment the workspace provisions (automatically set to the name suffix)" -> null
        id           = "var-vg83wH6DoYFmXJBr"
        # (6 unchanged attributes hidden)
    }

  # tfe_workspace.workspace["golden-gate-production"] will be updated in-place
  ~ resource "tfe_workspace" "workspace" {
      ~ auto_apply            = false -> true
        id                    = "ws-qKUjYsnbFb23x7ya"
        name                  = "golden-gate-production"
      ~ terraform_version     = "1.0.4" -> "1.0.5"
      - working_directory     = "projects/platform/aws/golden-gate" -> null
        # (9 unchanged attributes hidden)

      ~ vcs_repo {
          ~ identifier         = "TakeScoop/mars" -> "TakeScoop/aws-golden-gate"
            # (2 unchanged attributes hidden)
        }
    }

  # tfe_workspace.workspace["golden-gate-staging"] will be updated in-place
  ~ resource "tfe_workspace" "workspace" {
      ~ auto_apply            = false -> true
        id                    = "ws-2AwUNQgRhQBWivvf"
        name                  = "golden-gate-staging"
      ~ terraform_version     = "1.0.4" -> "1.0.5"
      - working_directory     = "projects/platform/aws/golden-gate" -> null
        # (9 unchanged attributes hidden)

      ~ vcs_repo {
          ~ identifier         = "TakeScoop/mars" -> "TakeScoop/aws-golden-gate"
            # (2 unchanged attributes hidden)
        }
    }

Plan: 0 to add, 4 to change, 0 to destroy.
" '. + { text_description: $plan }'
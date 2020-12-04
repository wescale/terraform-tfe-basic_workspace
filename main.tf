terraform {
  required_providers {
    tfe = "~> 0.15.0"
  }
}

resource "tfe_workspace" "workspace" {
  name = var.name
  organization = var.organization_id
  terraform_version = var.terraform_version
  file_triggers_enabled = true
  queue_all_runs = true

  vcs_repo {
    identifier = var.vcs_repo_identifier
    branch = var.vcs_repo_branch
    oauth_token_id = var.oauth_token_id
  }
}
provider "azuread" {}

resource "azuread_group" "devops_team" {
  display_name     = "DevOps-Team"
  security_enabled = true

  description = "DevOps team security group"

  owners = [
    data.azuread_client_config.current.object_id
  ]
}

data "azuread_client_config" "current" {}

output "group_display_name" {
  value = azuread_group.devops_team.display_name
}
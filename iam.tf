provider "azuread" {
  
  client_id        = "03c431f4-72e6-489c-8855-ea12afa4ead5"
  client_secret    = "6iF8Q~yDgX7ahRn8VFp6enBe.4sUJgQ4C34GtcYw"
  tenant_id        = "20ade2b2-2ce5-4299-8e61-44025f44b78b"
}

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
resource "azurerm_subscription_policy_assignment" "require_environment_tag_rg" {
  name                 = "require-environment-tag-rg"
  subscription_id      = "/subscriptions/${var.subscription_id}"
  policy_definition_id = var.policy_definition_id
  display_name         = "Require Environment Tag on Resource Groups"

  parameters = jsonencode({
    tagName = {
      value = "Environment"
    }
  })
}

resource "azurerm_resource_group_policy_assignment" "add_environment_tag" {
  name                 = "add-environment-tag"
  resource_group_id    = azurerm_resource_group.demo.id
  policy_definition_id = data.azurerm_policy_definition.add_tag_to_resources.id
  display_name         = "Add Environment Tag to Resources"

  identity {
    type = "SystemAssigned"
  }

  parameters = jsonencode({
    tagName = {
      value = "Environment"
    }
    tagValue = {
      value = "Production"
    }
  })
}
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
resource "azurerm_resource_group" "az_resouce_group" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Region            = var.location
    Team              = var.team_tag
    Environment       = var.env
    Creator           = var.creator
  }
}
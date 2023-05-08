locals {
  eventhubs = [
    for eventhub in var.eventhubs :
    {
      name              = eventhub.name
      partition_count   = eventhub.partition_count
      message_retention = eventhub.message_retention
    }
  ]
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_eventhub_namespace" "eventhubns" {
  name                = var.namespace_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.sku
  capacity            = var.capacity
}


resource "azurerm_eventhub" "eventhub" {
  for_each            = var.eventhubs
  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.eventhubns.name
  resource_group_name = var.resource_group_name

  message_retention = each.value.message_retention
  partition_count   = each.value.partition_count
}
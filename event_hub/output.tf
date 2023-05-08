output "eventhub_ids" {
    value = [for eh in azurerm_eventhub.eventhub: eh.id]
  
}

output "eventhubs" {
  description = "Azure Event Hubs outputs."
  value       = azurerm_eventhub.eventhub
}

variable "namespace_name" {
  type        = string
    default = "eventhubnamespaceNaaS"
  description = "name of event hub namespace in which we want to create eventhub"
}

variable "resource_group_name" {
  type        = string
  default = "eventhub-rg-logicapp"
  description = "name of resource group in which we want to create eventhub"
}

variable "location" {
  type        = string
  default = "eastus"
  description = "location of eventhub"
}

variable "sku" {
  description = "Defines which tier to use. Valid options are Basic and Standard."
  default     = "Standard"
}

variable "capacity" {
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace. Valid values range from 1 - 20."
  type        = number
  default     = 1
}

variable "eventhubs" {
  type = map(object({
    name              = string
    partition_count   = number
    message_retention = number
  }))
  default = {
    default = {
      name              ="test"
      partition_count   =2
      message_retention =2
}
  }
  description = "A list of maps defining the configurations for each Event Hub."

}
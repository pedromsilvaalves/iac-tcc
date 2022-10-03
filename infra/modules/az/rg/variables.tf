variable "resource_group_name" {
  description = "(Required) Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "(Required) Azure region"
  type        = string
  default     = "East US"
}

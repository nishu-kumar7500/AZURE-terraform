variable "resource_group_name" {
  default = "today-rg"
}

variable "location" {
  default = "central india"
}

variable "number_of_machines" {
  type        = number
  description = "This defines the number of virtual machines in the virtual network"
  default     = 2
}
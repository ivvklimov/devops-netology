variable "env_name" {
  description = "The name of the network"
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "zone" {
  description = "The zone in which to create the subnet"
  type        = string
}

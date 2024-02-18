variable "env_name" {
  description = "The name of the network"
  type        = string
}

variable "subnets" {
  description = "The list of subnets"
  type        = list(object({
    zone = string
    cidr = string
  }))
}
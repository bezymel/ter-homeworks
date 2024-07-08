###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

### ssh vars

variable "security_group_id" {
  type        = string
  description = "ID of the security group to associate with the instances"
}

variable "image_id" {
  type       =  string
  default    = "your image_id"
  description = "Ubuntu 22.04"
}

variable "subnet_id" {
  description = "ID of the subnet where the instances will be deployed"
  type        = string
}

variable "web_cores" {
  description = "Number of CPU cores for web instances"
  type        = number
  default     = 2
}

variable "web_core_fraction" {
  description = "Core fraction for web instances"
  type        = number
  default     = 5
}

variable "web_memory" {
  description = "Amount of memory for web instances (in MB)"
  type        = number
  default     = 1
}

variable "ssh_key" {
  description = "The public ssh key"
  type        = string
  sensitive   = true
}

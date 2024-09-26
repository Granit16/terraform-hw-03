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
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_web_image_ubuntu_2004" {
  type        = string
  description = "OS release name"
  default     = "ubuntu-2004-lts"
}


variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "platform_id" {
  type = string
  default = "standard-v2"
}

# vm's list
variable "each_vm" {
  type = list(object({ vm_name=string, cpu=number, ram=number, disk_volume=number }))
}

variable "vms_ssh_root_key" {
  type        = string
  default = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIOpMdS6Y/Swm4zm5RloPzVAIkRquRiUmVY3fVFenA0U damir@terraform-main"
  description = "ssh-keygen -t ed25519"
}

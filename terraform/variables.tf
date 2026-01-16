variable "yandex_cloud_id" {
  description = "yandex_cloud_id"
  type        = string
}

variable "yandex_folder_id" {
  description = "ID folder yandex"
  type        = string
}

variable "yandex_oauth_token" {
  description = "OAuth-API yandex"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "ssh_public_key"
  type        = string
}

variable "instance_name_prefix" {
  description = "instance_name_prefix"
  type        = string
  default     = "k8s-project"
}
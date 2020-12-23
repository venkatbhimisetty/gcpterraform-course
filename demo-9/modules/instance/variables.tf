variable "hostname" {
  description = "the hostname"
  type        = string
}
variable "machine_type" {
  description = "the instance type"
  type        = string
}
variable "project_name" {
  description = "the project for this instance"
  type        = string
}
variable "region_zone" {
  description = "the desired zone for the host"
  type        = string
}
variable "tags" {
  description = "the instance tags"
  type        = list(string)
}
variable "network_name" {
  description = "network for instances"
  type        = string
}
variable "subnet_name" {
  description = "the desired zone for the host"
  type        = string
}
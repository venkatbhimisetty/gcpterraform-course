variable "firewall_name" {
  description = "firewallname in network "
  type        = string
}
variable "network_name" {
  description = "firewallname in network "
  type        = string
}  
variable "direction" {
  description = "direction for the firewall INGRESS or EGRESS"
  type        = string
}
variable "priority" {
  description = "priority for the firewall "
  type        = string
}
variable "project_name" {
  description = "the project for this network"
  type        = string
}
variable "source_ranges" {
  description = "source ranges for firewalls"
  type        = string
}
variable "protocol" {
  description = "protocol for firewalls"
  type        = string
}
variable "ports" {
  description = "ports for firewalls"
  type        = string
}
variable "target_tags" {
  description = "tags for the firewall"
  type        = list(string)
}
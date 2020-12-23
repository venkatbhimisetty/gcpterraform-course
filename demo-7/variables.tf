variable "region" {}
variable "region_zone" {}
variable "project_name" {
  description = "The ID of the Google Cloud project"
}
variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
}

variable "network_name" {
  default     = "demovpc"
  description = "The name of the network being created"
}

/*variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}*/

/*variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}*/

variable "subnet_region" {
  default     = "us-central1"
}

variable "Public-subnet-cidr-range" {
  description = "Private subnet cidr range"
}

variable "Private-subnet-cidr-range" {
  description = "Private subnet cidr range"
}

variable "ssh_source_ranges" {
  description = "List of IP CIDR ranges for tag-based SSH rule, defaults to 0.0.0.0/0."
  default     = ["0.0.0.0/0"]
}

variable "rdp_source_ranges" {
  description = "List of IP CIDR ranges for tag-based SSH rule, defaults to 0.0.0.0/0."
  default     = ["0.0.0.0/0"]
}

variable "http_source_ranges" {
  description = "List of IP CIDR ranges for tag-based HTTP rule, defaults to 0.0.0.0/0."
  default     = ["0.0.0.0/0"]
}

variable "https_source_ranges" {
  description = "List of IP CIDR ranges for tag-based HTTPS rule, defaults to 0.0.0.0/0."
  default     = ["0.0.0.0/0"]
}

variable "global_ranges" {
  description = "ICMP rules allow global check"
  default     = ["0.0.0.0/0"]
}

variable "internal_ranges_enabled" {
  description = "Enable admin ranges-based rules."
  default     = true
}

variable "internal_ranges" {
  description = "IP CIDR ranges that have complete access to all subnets."
  default     = ["172.31.0.0/16"]
}

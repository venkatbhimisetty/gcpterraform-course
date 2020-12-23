variable "region" {}
variable "region_zone" {}
variable "project_name" {
  description = "The ID of the Google Cloud project"
}
variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
}

variable "network_name" {
  description = "The name of the network being created"
  default     = "demovpc"
}
variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}
variable "routing_mode" {
  type        = string
  description = "The network routing mode (default 'GLOBAL')"
  default     = "GLOBAL"
}
variable "network_description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = "modules testing vpc"
}
variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}
variable "mtu" {
  type        = number
  description = "The network MTU (default '1460'). Must be a value between 1460 and 1500 inclusive."
  default     = 1460
}

variable "public_subnet_name" {
  description = "public subnet name"
  default = "public-subnet"
}
variable "public_subnet_cidr_range" {
  description = "Private subnet cidr range"
  default = "10.10.10.0/24"
}
variable "private_subnet_name" {
  description = "Private subnet range"
  default = "private-subnet"
}
variable "private_subnet_cidr_range" {
  description = "Private subnet cidr range"
  default = "10.10.20.0/24"
}


variable "ssh_source_ranges" {
  description = "List of IP CIDR ranges for tag-based SSH rule, defaults to 0.0.0.0/0."
  default     = "0.0.0.0/0"
}
variable "icmp_source_ranges" {
  description = "List of IP CIDR ranges for tag-based ICMP rule, defaults to 0.0.0.0/0."
  default     = ["0.0.0.0/0"]
}

variable "rdp_source_ranges" {
  description = "List of IP CIDR ranges for tag-based RDP rule, defaults to 0.0.0.0/0."
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

variable "internal_ranges_enabled" {
  description = "Create rules for intra-VPC ranges."
  default     = true
}

variable "internal_ranges" {
  description = "IP CIDR ranges for intra-VPC rules."
  default     = ["0.0.0.0/0"]
}

variable "internal_allow" {
  description = "Allow rules for internal ranges."
  default = [
    {
      protocol = "icmp"
    },
  ]
}

variable "admin_ranges_enabled" {
  description = "Enable admin ranges-based rules."
  default     = true
}

variable "admin_ranges" {
  description = "IP CIDR ranges that have complete access to all subnets."
  default     = ["10.10.0.0/16"]
}

variable "bastion_machine_type" {
  description = "The instance size to use for your bastion instance."
  type        = string
  default     = "f1-micro"
}

variable "bastion_tags" {
  description = "A list of tags applied to your bastion instance."
  type        = list(string)
  default     = ["bastion"]
}

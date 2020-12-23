/******************************************
        VPC configuration details
 *****************************************/
output "network-name" {
  value       = google_compute_network.network.name
  description = "The unique name of the network"
}

output "network-gateway_ipv4" {
  value       = google_compute_network.network.gateway_ipv4  
  description = "The IPv4 address of the gateway"
}

output "network-id" {
  value       = google_compute_network.network.id
  description = "The URI of the created resource"
}

/******************************************
        Subnet configuration details
 *****************************************/
output "Public-subnet-gateway_address" {
  value       = google_compute_subnetwork.Public-subnet.gateway_address
  description = "The IP address of the gateway."
}

output "Public-subnet-self_link" {
  value       = google_compute_subnetwork.Public-subnet.self_link
  description = "The URI of the created resource"
}

output "Public-subnet-ip_cidr_range" {
  value       = google_compute_subnetwork.Public-subnet.ip_cidr_range
  description = "The IP address range that machines in this network are assigned to, represented as a CIDR block"
}
output "Public-subnet-name" {
  value       = google_compute_subnetwork.Public-subnet.name
  description = "Public-Subnet name"
}

output "Private-subnet-gateway_address" {
  value       = google_compute_subnetwork.Private-subnet.gateway_address
  description = "The IP address of the gateway."
}

output "Private-subnet-self_link" {
  value       = google_compute_subnetwork.Private-subnet.self_link
  description = "The URI of the created resource"
}

output "Private-subnet-ip_cidr_range" {
  value       = google_compute_subnetwork.Private-subnet.ip_cidr_range
  description = "The IP address range that machines in this network are assigned to, represented as a CIDR block"
}
output "Private-subnet-name" {
  value       = google_compute_subnetwork.Private-subnet.name
  description = "Private-Subnet name"
}


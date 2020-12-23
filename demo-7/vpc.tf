/******************************************
	VPC configuration
 *****************************************/
resource "google_compute_network" "network" {
  name                    = var.network_name
  description             = "Terraform test vpc in Gcloud"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
  mtu                     = 1500
  project                 = var.project_name
  
}

/******************************************
	Subnet configuration
 *****************************************/
resource "google_compute_subnetwork" "Public-subnet" {
  name          = "${var.network_name}-public"
  region        = var.subnet_region
  network       = google_compute_network.network.id
  ip_cidr_range = var.Public-subnet-cidr-range
  description   = "Public-Subnet"
  private_ip_google_access = false
}

resource "google_compute_subnetwork" "Private-subnet" {
  name          = "${var.network_name}-private"
  region        = var.subnet_region
  network       = google_compute_network.network.id
  ip_cidr_range = var.Private-subnet-cidr-range
  description   = "Private-subnet"
  private_ip_google_access = true
}


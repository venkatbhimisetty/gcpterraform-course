resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  description   = var.subnet_description
  region        = var.subnet_region
  network       = var.network_name
  ip_cidr_range = var.subnet_cidr_range
  private_ip_google_access = var.subnet_private_ip_google_access
}

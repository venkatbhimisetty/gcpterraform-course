resource "google_compute_firewall" "firewall" {
  name          = var.firewall_name
  network       = var.network_name
  direction     = var.direction
  priority      = var.priority
  project       = var.project_name
  source_ranges = [var.source_ranges]

  allow {
    protocol = var.protocol
    ports    = [var.ports]
  }

  target_tags = var.target_tags
}
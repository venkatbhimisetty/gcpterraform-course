resource "google_compute_firewall" "allow-ssh" {
  count         = length(var.ssh_source_ranges) > 0 ? 1 : 0
  name          = "${var.network_name}-allow-ssh"
  description   = "Allow SSH to machines with the 'ssh' tag"
  network       = google_compute_network.network.id
  project       = var.project_name
  priority      = "65534"
  source_ranges = var.ssh_source_ranges
  target_tags   = ["allow-global-ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow-global-rdp" {
  count         = length(var.rdp_source_ranges) > 0 ? 1 : 0
  name          = "${var.network_name}-allow-rdp"
  description   = "Allow SSH to machines with the 'rdp' tag"
  network       = google_compute_network.network.id
  project       = var.project_name
  priority      = "65534"
  source_ranges = var.rdp_source_ranges
  target_tags   = ["allow-global-rdp"]

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
}

resource "google_compute_firewall" "allow-http" {
  count         = length(var.http_source_ranges) > 0 ? 1 : 0
  name          = "${var.network_name}-allow-http"
  description   = "Allow HTTP to machines with the 'allow-http' tag"
  network       = google_compute_network.network.id
  project       = var.project_name
  source_ranges = var.http_source_ranges
  target_tags   = ["${var.network_name}-allow-http"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

resource "google_compute_firewall" "allow-https" {
  count         = length(var.https_source_ranges) > 0 ? 1 : 0
  name          = "${var.network_name}-allow-https"
  description   = "Allow HTTPS to machines with the 'allow-https' tag"
  network       = google_compute_network.network.id
  project       = var.project_name
  source_ranges = var.https_source_ranges
  target_tags   = ["${var.network_name}-allow-https"]

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

###############################################################################
#                            rules based on IP ranges
###############################################################################

resource "google_compute_firewall" "allow-icmp-global" {
  name          = "${var.network_name}-allow-icmp"
  description   = "Allow ingress traffic from internal IP ranges"
  network       = google_compute_network.network.id
  project       = var.project_name
  priority      = "65534"
  source_ranges = var.global_ranges
  target_tags   = ["${var.network_name}-allow-icmp"]

  allow {
    protocol = "icmp"
  }

}

resource "google_compute_firewall" "allow-tag-internal" {
  count         = var.internal_ranges_enabled == true ? 1 : 0
  name          = "${var.network_name}-allow-internal"
  description   = "Internal communication betwwen to all subnets"
  network       = google_compute_network.network.id
  project       = var.project_name
  priority      = "65534"
  source_ranges = var.internal_ranges

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
}

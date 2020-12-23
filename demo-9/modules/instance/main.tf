resource "google_compute_instance" "instance" {
name         = var.hostname
machine_type = var.machine_type
zone         = var.region_zone
project      = var.project_name
tags         = var.tags

// Specify the Operating System Family and version.
boot_disk {
initialize_params {
image = "ubuntu-os-cloud/ubuntu-1604-lts"
}
}

// Define a network interface in the correct subnet.
network_interface {
network    = var.network_name
subnetwork = var.subnet_name

// Add an ephemeral external IP.
access_config {
// Ephemeral IP
}
}

// Ensure that when the bastion host is booted, it will have kubectl.

// Allow the instance to be stopped by terraform when updating configuration
allow_stopping_for_update = true

// Necessary scopes for administering kubernetes.

}

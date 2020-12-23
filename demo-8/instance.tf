data "google_compute_network" "network" {
  name = "demovpc"
}
data "google_compute_subnetwork" "subnetwork" {
  name   = "demovpc-public"
  region = "us-central1"
}
resource "google_compute_instance" "test-instance" {
 name         = "test-instance"
 machine_type = "f1-micro"
 zone         = "us-central1-a"

 boot_disk {
   initialize_params {
     image = "ubuntu-os-cloud/ubuntu-1604-lts"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = file("/home/ubuntu/gcpterraform-course/demo-8/ansscript.sh")

 network_interface {
   network = data.google_compute_network.network.id
   subnetwork = data.google_compute_subnetwork.subnetwork.name
   access_config {
     // Include this section to give the VM an external ip address
   }
 }
 metadata = {
    ssh-keys = "ubuntu:${file("/home/ubuntu/.ssh/gcpkey.pub")}"
      // ssh-keygen -t rsa -f ~/.ssh/publey -C ubuntu
  }
   
}

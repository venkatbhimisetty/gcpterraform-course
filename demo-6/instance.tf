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
 //metadata_startup_script = file("script file")

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
    
}

output "testinstance-Externalip" {
 value = google_compute_instance.test-instance.network_interface.0.access_config.0.nat_ip
}

output "testinstance-Intenalip" {
 value = google_compute_instance.test-instance.network_interface.0.network_ip
}


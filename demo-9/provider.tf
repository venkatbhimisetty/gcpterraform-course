provider "google" {
  region      = var.region
  zone        = var.region_zone
  project     = var.project_name
  credentials = file(var.credentials_file_path)
}

variable "region" {}
variable "region_zone" {}
variable "project_name" {
  description = "The ID of the Google Cloud project"
}
variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
}
variable "bucket_name" {
  type = string
  default = "gcsterraformtest"
}
variable "bucket_location" {
  type = string
  default = "US"
}
variable "storage_class" {
  type = string
  default = "MULTI_REGIONAL"
}
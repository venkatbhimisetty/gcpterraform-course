terraform {
  backend "gcs" {
    bucket  = "gcsterraformtest"
    prefix  = "terraform/state"
    credentials = "/home/ubuntu/gcpterraform-course/hostproj-adminkey.json"
  }
}
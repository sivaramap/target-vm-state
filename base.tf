provider "google" {
  credentials = file("terraform-cred.json")
  project = "mytraining-gcptech"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_address" "static-ip" {
  name = "static-ip"
  address_type = "EXTERNAL"
}
resource "google_compute_instance" "base" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
	  }
  metadata_startup_script = file("startup.sh")

network_interface {
  # A default network is created for all GCP projects
  network = "default"
  access_config {

  }
}
}

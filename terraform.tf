provider "google" {
  credentials = "${file("My First Project-4de6cc1605a7.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_instance" "default" {
  name         = "terraform-test"
  machine_type = "${var.instance_type}"
  zone         = "${var.zone_id}"


  boot_disk {
    initialize_params {
      image = "${var.image_name}"
      size = "${var.disk_size}"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

}

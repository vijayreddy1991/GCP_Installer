provider "google" {
  credentials = "${file("gcp.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_instance" "default" {
  name         = "ubuntu16"
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

resource "google_compute_project_metadata" "default" {
metadata = {
   sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
project = "${var.project}"

}
output "ip" {
value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}

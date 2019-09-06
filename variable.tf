variable "instance_type" {
default = "n1-standard-1"
}
variable "zone_id" {
default = "us-central1-a"
}
variable "image_name" {
default = "ubuntu-os-cloud/ubuntu-1604-lts"
}
variable "disk_size" {
default = 30
}
variable "region" {
 default = "us-central1"
}
variable "project" {
 default = "pure-spring-242015"
}

variable "gce_ssh_pub_key_file" {
 default = "~/.ssh/id_rsa.pub"
}
variable "gce_ssh_user" {
 default = "vijay"
}

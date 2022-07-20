#Veriables

#VM's
variable "image_type" {  default = "debian-10-buster-v20220406"}

variable "image_type-redhat" {  default = "rhel-8-v20220519"}

variable "machine_types" {default = "e2-standard-4"}

variable "name_count" { default =["server1", "server2"] }

#Regions
variable "region_asia-south1" {  default = "asia-south1"}

variable "region_us-central1" {  default = "us-central1"}

#zones
variable "zone_aisa_south1" {  default = "asia-south1-a"}

variable "zone_us_central1" {  default = "us-central1-a"}

variable "service_account" {  default = "1028362908888-compute@developer.gserviceaccount.com"}

variable "Project" {
  default = "learn-cloud-1989"
}
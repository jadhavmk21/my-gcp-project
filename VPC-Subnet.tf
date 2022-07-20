#Create VPC -1
resource "google_compute_network" "learn-cloud-1989-vpc1" {
  project = var.Project
  name = "learn-cloud-1989-vpc1"
  description = "Dev VPC"
  auto_create_subnetworks = false
}

#Create VPC -2
resource "google_compute_network" "learn-cloud-1989-vpc2" {
  project = var.Project
  name = "learn-cloud-1989-vpc2"
  description = "Dev VPC"
  auto_create_subnetworks = false
}


#Create subnet-1 - asia-south1
resource "google_compute_subnetwork" "us-central1-subnet-1" {
  name = "us-central1-subnet-1"
  project = google_compute_network.learn-cloud-1989-vpc1.project
  network = google_compute_network.learn-cloud-1989-vpc1.id
  region = var.region_us-central1
  ip_cidr_range = "10.10.160.0/20"
  private_ip_google_access = true
  

   log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata = "INCLUDE_ALL_METADATA"
  }
}

#Create subnet-2 - us-cenral1
resource "google_compute_subnetwork" "asia-south1-subnet-1" {
  name = "asia-south1-subnet-1"
  project = google_compute_network.learn-cloud-1989-vpc2.project
  network = google_compute_network.learn-cloud-1989-vpc2.id
  region = var.region_asia-south1
  ip_cidr_range = "10.11.160.0/20"
  private_ip_google_access = true
  
   log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata = "INCLUDE_ALL_METADATA"
  }
}


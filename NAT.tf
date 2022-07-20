#Nat 1 -asia-south1 region
#resource "google_compute_router_nat" "asia-south1-nat" {
#  name                               = "asia-south1-nat"
#  router                             = "${google_compute_router.asia-south1-router.name}"
#  region                             = var.region_asia-south1
#  nat_ip_allocate_option             = "AUTO_ONLY"
#  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

#  log_config {
#    enable = true
#    filter = "ERRORS_ONLY"
#  }
#}


#Nat 2 -us-central1 region
resource "google_compute_router_nat" "us-central1-nat" {
  name                               = "us-central1-nat"
  router                             = "${google_compute_router.us-central-router.name}"
  region                             = var.region_us-central1
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
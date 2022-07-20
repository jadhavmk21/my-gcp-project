#resource "google_compute_router" "asia-south1-router" {
#  name    = "asia-south1-router"
#  network = google_compute_network.proj1-vpc1.id
#  region = "asia-south1"
#  bgp {
#    asn               = 64514
#    advertise_mode    = "CUSTOM"
#    advertised_groups = ["ALL_SUBNETS"]
#    advertised_ip_ranges {
#      range = "1.2.3.4"
#    }
#   advertised_ip_ranges {
#      range = "6.7.0.0/16"
#    }
#  }
#}



resource "google_compute_router" "us-central-router" {
  name    = "us-central-router"
  network = google_compute_network.learn-cloud-1989-vpc2.id
  region = var.region_asia-south1
  bgp {
    asn               = 64514
#    advertise_mode    = "CUSTOM"
#    advertised_groups = ["ALL_SUBNETS"]
#    advertised_ip_ranges {
#      range = "1.2.3.4"
#    }
#   advertised_ip_ranges {
#      range = "6.7.0.0/16"
#    }
  }
}



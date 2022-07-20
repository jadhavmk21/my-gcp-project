#Peering with vpc2 from vpc1
resource "google_compute_network_peering" "learn-cloud-1989-peering1" {
  name = "learn-cloud-1989-peering1"
  network = google_compute_network.learn-cloud-1989-vpc1.id
  peer_network = google_compute_network.learn-cloud-1989-vpc2.id

  import_custom_routes = true
  export_custom_routes = true
  import_subnet_routes_with_public_ip = false
}

#Peering with vpc1 from vpc2
resource "google_compute_network_peering" "learn-cloud-1989-peering2" {
  name = "learn-cloud-1989-peering2"
  network = google_compute_network.learn-cloud-1989-vpc2.id
  peer_network = google_compute_network.learn-cloud-1989-vpc1.id

  import_custom_routes = true
  export_custom_routes = true
  import_subnet_routes_with_public_ip = false
}
#Create Firewall rule to allow SSH trafic vpc1- Enable IAP
resource "google_compute_firewall" "enable-iap-vpc1" {
  name = "enable-iap-vpc1"
  network = google_compute_network.learn-cloud-1989-vpc1.id
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports = [ "22","8080","8081","3128","10000"]
      }
  source_ranges = ["35.235.240.0/20"]
  source_tags = [ "account" ]
  priority = 1000

    log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

#Create Firewall rule to allow SSH trafic vpc2- Enable IAP
resource "google_compute_firewall" "enable-iap-vpc2" {
  name = "enable-iap-vpc2"
  network = google_compute_network.learn-cloud-1989-vpc2.id
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports = [ "22","8080","8081","3128","10000" ]
      }
  source_ranges = ["35.235.240.0/20"]
  source_tags = [ "account" ]
  priority = 1000

    log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

#Allow ICMP ping trafic
resource "google_compute_firewall" "allow-icmp-trafic-vpc1" {
  name = "allow-icmp-trafic-vpc1"
  network = google_compute_network.learn-cloud-1989-vpc1.id
  #direction = "INGRESS"
  allow {
    protocol = "icmp"
      }
  source_ranges = ["10.10.160.0/20","10.11.160.0/20"]
  priority = 1000
  source_tags = ["squidsrv"]
  target_tags = ["testsrv"]

    log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

#Allow ICMP ping trafic vpc2
resource "google_compute_firewall" "allow-icmp-trafic-vpc2" {
  name = "allow-icmp-trafic-vpc2"
  network = google_compute_network.learn-cloud-1989-vpc2.id
  #direction = "EGRESS"
  allow {
    protocol = "icmp"
      }
  source_ranges = ["10.11.160.0/20","10.10.160.0/20"]
  priority = 1000
  source_tags = ["testsrv"]
  target_tags = ["squidsrv"]

    log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

#Create Firewall rule to allow HTTP/HTTPS trafic vpc1
resource "google_compute_firewall" "enable-http-vpc1" {
  name = "enable-http-vpc1"
  network = google_compute_network.learn-cloud-1989-vpc1.id
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports = [ "80","443","9090"]
      }
  source_ranges = ["10.11.160.0/20","10.10.160.0/20","0.0.0.0/0"]
  priority = 1000
  #source_tags = ["testsrv"]
  #target_tags = ["squidsrv"]

    log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

#Create Firewall rule to allow HTTP/HTTPS trafic vpc2
resource "google_compute_firewall" "enable-http-vpc2" {
  name = "enable-http-vpc2"
  network = google_compute_network.learn-cloud-1989-vpc2.id
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports = [ "80","443","9090"]
      }
  source_ranges = ["10.11.160.0/20","10.10.160.0/20","0.0.0.0/0"]
  priority = 1000
  #source_tags = ["testsrv"]
  #target_tags = ["squidsrv"]

    log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}
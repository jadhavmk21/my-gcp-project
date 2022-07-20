resource "google_compute_instance" "srv-squid" {
  name = "srv-squid"
  zone = var.zone_aisa_south1
  machine_type = var.machine_types
  can_ip_forward = true
  allow_stopping_for_update = true   
  labels = {
    "dept" = "account"
  }
  
  network_interface {
    network = google_compute_network.learn-cloud-1989-vpc2.id
    subnetwork = google_compute_subnetwork.asia-south1-subnet-1.id
    #access_config {
    #network_tier = "STANDARD"
    # }
  }

  tags = ["squidsrv"]

  boot_disk {
    initialize_params {
      image = var.image_type-redhat
      size = "20"
    }
    auto_delete = true
  }
  scheduling {
    preemptible = true
    automatic_restart = false
  }
  lifecycle {
      ignore_changes = [attached_disk]
  }

  #metadata_startup_script = file("${path.module}/squid.sh")
  metadata_startup_script = "${file("/sh-scripts/squid.sh")}"
   
  service_account {
    email = var.service_account
    scopes = [ "cloud-platform" ]
  }

  metadata = {
    "enable-oslogin" = "TRUE",
	   block-project-ssh-keys = true
  }
}



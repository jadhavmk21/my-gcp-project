resource "google_compute_instance" "srv4-jenkins" {
  name = "srv-jenkins"
  zone = var.zone_us_central1
  machine_type = var.machine_types
  can_ip_forward = true
  allow_stopping_for_update = true   
  labels = {
    "dept" = "account"
  }
  
  network_interface {
    network = google_compute_network.learn-cloud-1989-vpc1.id
    subnetwork = google_compute_subnetwork.us-central1-subnet-1.id
    #access_config {
    #network_tier = "STANDARD"
    #}
  }

  tags = ["testsrv"]

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

  #metadata_startup_script = file("${path.module}/jenkins.sh")
  metadata_startup_script = "${file("/sh-scripts/jenkins.sh")}"
   
  service_account {
    email = var.service_account
    scopes = [ "cloud-platform" ]
  }

  metadata = {
    "enable-oslogin" = "TRUE",
	   block-project-ssh-keys = true
  }
}



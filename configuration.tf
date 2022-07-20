terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.53"
    }
  }
}

provider "google" {
  # Configuration options
  project = "learn-cloud-1989"
  credentials = file("learn-cloud-1989-980069a4b58b.json")
  region = "us-central1"
  zone = "us-central1-a"
}

#resource "google_project_service" "cloud_resource_manager" {
#  project = var.Project
#  service = "cloudresourcemanager.googleapis.com"
#  disable_dependent_services = true
#}

resource "google_project_service" "iap_service" {
  project = var.Project
  service = "iap.googleapis.com"
}

resource "google_project_service" "logging_service" {
  project = var.Project
  service = "logging.googleapis.com"
}

resource "google_project_service" "kubernetes_engine" {
  project = var.Project
  service = "container.googleapis.com"
}

resource "google_project_service" "CloudAPI" {
  project = var.Project
  service = "cloudapis.googleapis.com"
}


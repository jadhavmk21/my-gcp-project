#Service Account for Ansible
resource "google_service_account" "ansible" {
  account_id   = "ansible"
  display_name = "A service account that only use for cloud Learning"
}

resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.ansible.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:learngcloud1989@gmail.com",
  ]

  condition {
    title       = "expires_after_2025_12_31"
    description = "Expiring at midnight of 2025-12-31"
    expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
  }
}

#Service Account for jenkins
resource "google_service_account" "jenkins" {
  account_id   = "jenkins"
  display_name = "A service account that only use for cloud Learning"
}

resource "google_service_account_iam_binding" "admin-account-jenkins" {
  service_account_id = google_service_account.jenkins.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:learngcloud1989@gmail.com",
  ]

  condition {
    title       = "expires_after_2025_12_31"
    description = "Expiring at midnight of 2025-12-31"
    expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
  }
}

#Service Account for Squid Proxy
resource "google_service_account" "squid-proxy" {
  account_id   = "squid-proxy"
  display_name = "A service account that only use for cloud Learning"
}

resource "google_service_account_iam_binding" "admin-account-squid" {
  service_account_id = google_service_account.squid-proxy.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:learngcloud1989@gmail.com",
  ]

  condition {
    title       = "expires_after_2025_12_31"
    description = "Expiring at midnight of 2025-12-31"
    expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
  }
}
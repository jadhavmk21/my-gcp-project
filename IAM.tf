resource "google_service_account" "service_account" {
  account_id   = "ansible-controller"
  display_name = "Service Account"
}
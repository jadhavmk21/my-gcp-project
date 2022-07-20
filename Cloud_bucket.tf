# Create Bucket
resource google_storage_bucket "my-gcp-storage-bucket1" {
name = "my-gcp-storage-bucket1"
location = "us-central1"
storage_class = "Standard"
uniform_bucket_level_access = true

labels = {
  env = "test"
  dept = "testing"
}
retention_policy {
  is_locked = false
  retention_period = 200000
}
#lifecycle_rule {
#  condition {
#    age = 3

  
#  action {
#    type = "SetStorageClass"
#    storage_class = "Standard"
#  }

}

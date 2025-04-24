resource "google_storage_bucket" "logs" {
  name     = "app-logs-${random_id.bucket_suffix.hex}"
  location = var.region
  force_destroy = true
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
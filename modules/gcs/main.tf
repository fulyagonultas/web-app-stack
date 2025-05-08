# GCS Bucket Creation
resource "google_storage_bucket" "logs" {
  project       = var.project_id
  name          = "app-logs-${random_id.bucket_suffix.hex}"
  location      = var.region
  force_destroy = true
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Service Account Creation with Storage Object User role for writing logs to the bucket and retrieve assets from the bucket
resource "google_service_account" "object_user" {
  project = var.project_id
  account_id   = "gcs-access"
  display_name = "App Access to GCS Bucket"
}

resource "google_storage_bucket_iam_member" "object_user" {
  bucket = google_storage_bucket.logs.name
  role   = "roles/storage.objectUser"
  member = "serviceAccount:${google_service_account.object_user.email}"
}


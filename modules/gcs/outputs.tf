output "bucket_name" {
  value = google_storage_bucket.logs.name
}

output "service_account_email" {
  value = google_service_account.object_user.email
}
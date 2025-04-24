resource "google_service_account" "app_sa" {
  account_id   = "app-sa"
  display_name = "App Service Account"
}
output "cluster_name" {
  value = google_container_cluster.main
}

output "endpoint" {
  value = google_container_cluster.main.endpoint
}

output "cluster_ca_certificate" {
  value = google_container_cluster.main.master_auth[0].cluster_ca_certificate
}

output "token" {
  value = data.google_client_config.default.access_token
}

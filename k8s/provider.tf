provider "kubernetes" {
  host                   = var.cluster_endpoint
  token                  = var.token
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    token                  = var.token
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  }
}

# data "google_client_config" "default" {}

# data "google_container_cluster" "gke" {
#   name     = "gke-cluster"
#   location = "europe-west3"
#   project  = "recruiting-fulya-g"
# }

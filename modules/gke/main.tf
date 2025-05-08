# Creates GKE Cluster
resource "google_container_cluster" "main" {
  name                     = "gke-cluster"
  project                  = var.project_id
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network
  subnetwork = var.subnet

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = false
    }

    network_policy_config {
      disabled = false
    }
  }

  cluster_autoscaling {
    enabled = true

    resource_limits {
      resource_type = "cpu"
      minimum       = 1
      maximum       = 8
    }

    resource_limits {
      resource_type = "memory"
      minimum       = 1
      maximum       = 32
    }
  }
}

# GKE Node Pool Configuration
resource "google_container_node_pool" "main" {
  name     = "gke-pool"
  project  = var.project_id
  location = var.region
  cluster  = google_container_cluster.main.name

  node_config {
    machine_type    = var.machine_type
    service_account = var.node_service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    tags = ["http-server"]
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }
}

run "vpc_setup" {
  command = apply

  module {
    source      = "../vpc"
  }

variables {
  project_id   = "recruiting-fulya-g"
  region       = "europe-west3"
  subnet_cidr  = "10.10.0.0/24"
  machine_type = "e2-medium"
}

  assert {
    condition     = runs.vpc_setup.outputs.network_name == "vpc"
    error_message = "VPC should be named 'vpc'."
  }
}

variables {
  project_id   = "recruiting-fulya-g"
  region       = "europe-west3"
  network      = "vpc"
  subnet       = "subnet"
  machine_type = "e2-medium"
}

run "run-gke-module" {
  module {
    source = "./"
  }

  assert {
    condition     = output.cluster_name == "gke-cluster"
    error_message = "Expected GKE cluster to be named 'gke-cluster'."
  }

  assert {
    condition     = output.node_pool_name == "gke-pool"
    error_message = "Expected GKE node pool to be named 'gke-pool'."
  }
}

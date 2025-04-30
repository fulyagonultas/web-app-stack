module "vpc" {
  source      = "./modules/vpc"
  region      = var.region
  project_id  = var.project_id
  subnet_cidr = "10.10.0.0/24"
}

module "gcs" {
  source     = "./modules/gcs"
  project_id = var.project_id
  region     = var.region
}

module "gke" {
  source       = "./modules/gke"
  project_id   = var.project_id
  region       = var.region
  network      = module.vpc.network_name
  subnet       = module.vpc.subnet_name
  machine_type = "e2-medium"
}

module "k8s" {
  source                 = "./k8s"
  region                 = var.region
  project_id             = var.project_id
  cluster_endpoint       = "https://${module.gke.endpoint}"
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  token                  = module.gke.token
}

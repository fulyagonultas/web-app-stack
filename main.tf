module "networking" {
  source      = "./modules/networking"
  region      = var.region
  subnet_cidr = "10.10.0.0/24"
}

module "gcs" {
  source = "./modules/gcs"
  region = var.region
}

module "iam" {
  source = "./modules/iam"
}

module "gke" {
  source       = "./modules/gke"
  region       = var.region
  network      = module.networking.network_name
  subnet       = module.networking.subnet_name
  machine_type = "e2-medium"
}

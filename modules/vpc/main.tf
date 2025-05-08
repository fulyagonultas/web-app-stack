# Create a custom VPC network
resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = "vpc"
  auto_create_subnetworks = false
}

# Create a subnet within the custom VPC
# Enables Private Google Access so GKE nodes can reach Google APIs (e.g., GCS) without public IPs
resource "google_compute_subnetwork" "subnet" {
  name          = "subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id

  private_ip_google_access = true
}

# Create a firewall rule to allow inbound HTTPS traffic (TCP port 443) from any IP
resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

# Create a Cloud Router to be used by Cloud NAT
resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  network = google_compute_network.vpc_network.id
  region  = var.region
}

# Configure Cloud NAT to allow private GKE nodes to access the internet
resource "google_compute_router_nat" "cloud_nat" {
  name                               = "cloud-nat"
  router                             = google_compute_router.nat_router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  enable_endpoint_independent_mapping = true
}

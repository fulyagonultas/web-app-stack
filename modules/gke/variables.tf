variable "region" {
  description = "The GCP Region"
}
variable "network" {
  description = "The VPC Network"
}
variable "subnet" {
  description = "The VPC Subnetwork"
}
variable "machine_type" {
  description = "The Nodepool Machine Type"
  default = "e2-medium"
}
variable "project_id" {
  description = "The GCP Project ID"
}
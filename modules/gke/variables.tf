variable "region" {
  description = "The GCP Region"
  type        = string
}

variable "network" {
  description = "The VPC Network"
  type        = string
}

variable "subnet" {
  description = "The VPC Subnetwork"
  type        = string
}

variable "machine_type" {
  default     = "e2-medium"
  description = "The Nodepool Machine Type"
  type        = string
}

variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "node_service_account_email" {
  description = "Service Account Email used by GKE nodes"
  type        = string
}
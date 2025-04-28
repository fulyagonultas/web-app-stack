variable "region" {
  description = "The GCP region"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "cluster_endpoint" {
  description = "The endpoint for the GKE cluster"
  type        = string
}

variable "cluster_ca_certificate" {
  description = "The CA certificate for the GKE cluster"
  type        = string
}

variable "token" {
  description = "The access token for the GKE cluster"
  type        = string
}

variables {
  prefix      = "webapp"
  region      = "europe-west3"
  subnet_cidr = "10.0.0.0/24"
  project_id  = "recruiting-fulya-g"
}

provider "google" {
  project = var.project_id
  region  = var.region
}


run "run-module" {
  module {
    source = "./"
  }

  assert {
    condition     = output.network_name == "vpc"
    error_message = "Expected VPC name to be 'vpc'."
  }

  assert {
    condition     = output.subnet_name == "subnet"
    error_message = "Expected Subnet name to be 'subnet'."
  }
}

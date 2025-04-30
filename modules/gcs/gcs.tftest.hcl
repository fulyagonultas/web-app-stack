variables {
  project_id = "recruiting-fulya-g"
  region     = "europe-west3"
}

run "run-gcs-module" {
  module {
    source = "./"
  }

  assert {
    condition     = length(output.bucket_name) > 0
    error_message = "Expected GCS bucket_name to have a non-empty value."
  }

  assert {
    condition     = contains(output.bucket_name, "app-logs-")
    error_message = "Expected GCS bucket_name to start with 'app-logs-'."
  }
}

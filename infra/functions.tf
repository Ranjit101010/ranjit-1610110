resource "google_cloudfunctions2_function" "function" {
  for_each    = var.cloud_functions
  name        = each.value.name
  location    = var.region
  description = each.value.description

  build_config {
    runtime     = each.value.runtime
    entry_point = each.value.entry_point # Set the entry point 
    source {
      storage_source {
        bucket = google_storage_bucket.bucket["bucket_fn"].name
        object = google_storage_bucket_object.source_zip["api_to_gcs_source"].name
      }
    }
  }

  service_config {
    max_instance_count = each.value.max_instance_count
    available_memory   = each.value.available_memory
    timeout_seconds    = each.value.timeout_seconds
  }
}
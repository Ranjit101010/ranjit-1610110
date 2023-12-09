# bucket for storing apis and storing zip file for source code
resource "google_storage_bucket" "bucket" {
  for_each                 = var.bucket
  name                     = each.value.name
  location                 = var.region
  force_destroy            = each.value.force_destroy
  public_access_prevention = each.value.public_access_prevention
}

# add source path and convert it into zip
data "archive_file" "source" {
  for_each    = var.fn_object
  type        = each.value.type
  source_dir  = each.value.source_dir
  output_path = each.value.output_path
}

# Add source code zip to the Cloud Function's bucket
resource "google_storage_bucket_object" "source_zip" {
  for_each     = var.fn_object
  source       = data.archive_file.source["api_to_gcs_source"].output_path
  content_type = each.value.type
  name         = "src-api-to-gcs.zip"
  bucket       = google_storage_bucket.bucket["bucket_fn"].name
  depends_on = [
    google_storage_bucket.bucket, # declared in `storage.tf`
    data.archive_file.source
  ]
}

# bucket objects for processing api data
resource "google_storage_bucket_object" "objects" {
  for_each = var.bucket_objects
  name     = each.value.name
  content  = each.value.content
  bucket   = google_storage_bucket.bucket["bucket_gcs_to_bq"].name
  depends_on = [
    google_storage_bucket.bucket
  ]
}
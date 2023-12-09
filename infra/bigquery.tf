# datsets in bigquery
resource "google_bigquery_dataset" "dataset" {
  for_each                    = var.bq_datasets
  dataset_id                  = each.value.dataset_id
  description                 = each.value.description
  location                    = var.region
  default_table_expiration_ms = each.value.default_table_expiration_ms
}

# tables in bigquery
resource "google_bigquery_table" "default" {
  for_each            = var.bq_tables
  dataset_id          = each.value.dataset_id
  table_id            = each.value.table_id
  deletion_protection = each.value.delete_protection
  time_partitioning {
    type = each.value.type
  }
  schema     = file(each.value.schema)
  depends_on = [google_bigquery_dataset.dataset]
}
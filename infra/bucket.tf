resource "google_storage_bucket" "auto-expire" {
  for_each                 = var.bucket
  name                     = each.value.name
  location                 = var.region
  force_destroy            = each.force_destroy
  public_access_prevention = each.value.public_access_prevention
}
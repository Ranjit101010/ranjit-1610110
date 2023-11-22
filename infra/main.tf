resource "google_storage_bucket" "auto-expire" {
  name          = "ranjit-1610110-d"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "ranjit-1610110-tfstate"
    prefix = "terraform/state"
  }
} 
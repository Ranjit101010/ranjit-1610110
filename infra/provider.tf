terraform {
  backend "gcs" {
    bucket = "ranjit-1610110-tfstate"
    prefix = "terraform/state"
  }
} 
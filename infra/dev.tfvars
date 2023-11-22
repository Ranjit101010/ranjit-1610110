project_id      = "ranjit-1610110"
region          = "us-east1"
tf_state_bucket = "ranjit-1610110-tfstate"

bucket = {
  sample_bucket = {
    name                     = "ranjit-1610110-d"
    force_destroy            = true
    public_access_prevention = "enforced"
  }
}
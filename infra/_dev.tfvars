project_id      = "ranjit-1610110"
region          = "us-east1"
tf_state_bucket = "ranjit-1610110-tfstate"

bucket = {
  bucket_fn = {
    name                     = "bucket-src-code-d"
    force_destroy            = true
    public_access_prevention = "enforced"
  },
  bucket_gcs_to_bq = {
    name                     = "bucket-gcs-to-bq-d"
    force_destroy            = true
    public_access_prevention = "enforced"
  }

}

fn_object = {
  api_to_gcs_source = {
    type        = "zip"
    source_dir  = "../src"
    output_path = "./tmp/function.zip"
  }
}

bucket_objects = {
  incoming_folder = {
    name    = "incoming/"
    content = "this is the incoming folder"
  },
  archive_folder = {
    name    = "archive/"
    content = "this is the archive folder"
  },
  error_folder = {
    name    = "error/"
    content = "this is the error folder"
  }
}


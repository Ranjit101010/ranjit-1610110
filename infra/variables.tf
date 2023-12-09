variable "project_id" {
  type        = string
  description = "the gcp project id"
}

variable "region" {
  type        = string
  description = "the region of the project"
}

variable "tf_state_bucket" {
  type        = string
  description = "the bucket which is used to store the terraform stat files"
}

# bucket for storing api data and function zip file
variable "bucket" {
  type = map(object({
    name                     = string
    force_destroy            = bool
    public_access_prevention = string
  }))
}

# declaring variables for source code zip
variable "fn_object" {
  type = map(object({
    type        = string
    source_dir  = string
    output_path = string
  }))
}

# declaring variablles for folders
variable "bucket_objects" {
  type = map(object({
    name    = string
    content = string
  }))
}

# declaring variables for datasets in biquery
variable "bq_datasets" {
  type = map(object({
    dataset_id                  = string
    description                 = string
    default_table_expiration_ms = number
  }))
}

# declaring table variables
variable "bq_tables" {
  type = map(object({
    dataset_id        = string
    table_id          = string
    type              = string
    schema            = string
    delete_protection = bool
  }))
}

# declaring functions variables
variable "cloud_functions" {
  type = map(object({
    name               = string
    description        = string
    runtime            = string
    entry_point        = string
    max_instance_count = number
    available_memory   = string
    timeout_seconds    = number
  }))
}
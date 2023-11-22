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

variable "bucket" {
  type = map(object({
    name                     = string
    force_destroy            = bool
    public_access_prevention = string
  }))
}
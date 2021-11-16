variable "project" {
  description = "Google Cloud Platform project id"

  type = "string"
}

variable "image" {
  description = "Docker image hosted on Google Cloud. See https://cloud.google.com/run/docs/deploying"
  type = string
}

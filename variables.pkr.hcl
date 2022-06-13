variable "gcp_subnet" {
  type    = string
  default = ""
  description = "Defines in which GCP subnet from desired project to run the build"
}

variable "gcp_vpc" {
  type    = string
  default = "main"
  description = "Defines in which GCP vpc from desired project to run the build"
}

variable "gcp_project" {
  type = string
  default = "inspira-registry"
  description = "Defines in which GCP project the image will be built and stored"
}

variable "gcp_zone" {
  type = string
  default = "us-central1-a"
  description = "Defines in which GCP zone from desired project to run the build"
}

locals {
  timestamp = formatdate("YYYY-MM-DD", timestamp())

  labels = {
    "infra-type": "server",
    "role": "packer"
  }
}

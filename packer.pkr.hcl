packer {
  required_version = ">= 1.8.0"

  required_plugins {
    googlecompute = {
      version = ">= 1.0.10"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

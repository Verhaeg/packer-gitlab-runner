build {
  description = "Debian with Docker for GitLab Runner"

  sources = [
    "sources.googlecompute.debian",
  ]

  provisioner "shell" {
    script = "install-packages-debian.sh"
  }
}

build {
  description = "Ubuntu with Docker for GitLab Runner"

  sources = [
    "sources.googlecompute.ubuntu-18",
    "sources.googlecompute.ubuntu-20",
  ]

  provisioner "shell" {
    script = "install-packages-ubuntu.sh"
  }
}

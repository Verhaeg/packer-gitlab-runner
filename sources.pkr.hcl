source "googlecompute" "debian" {
  disk_size           = 30

  image_description   = "Base Debian image for GitLab Runner"
  image_family        = "gitlab-runner-debian"
  image_name          = "gitlab-runner-debian-${local.timestamp}"

  image_labels        = "${local.labels}"
  labels              = "${local.labels}"
  tags                = ["ssh", "packer"]

  project_id          = "${var.gcp_project}"
  network             = "projects/${var.gcp_project}/global/networks/${var.gcp_vpc}"
  subnetwork          = "${var.gcp_subnet}"
  zone                = "${var.gcp_zone}"

  preemptible         = true
  source_image_family = "debian-11"

  use_iap             = true
  ssh_username        = "packer"
}

source "googlecompute" "ubuntu-18" {
  disk_size           = 30

  image_description   = "Base Ubuntu image for GitLab Runner"
  image_family        = "gitlab-runner-ubuntu-18"
  image_name          = "gitlab-runner-ubuntu-18-${local.timestamp}"

  image_labels        = "${local.labels}"
  labels              = "${local.labels}"
  tags                = ["ssh", "packer"]

  project_id          = "${var.gcp_project}"
  network             = "projects/${var.gcp_project}/global/networks/${var.gcp_vpc}"
  subnetwork          = "${var.gcp_subnet}"
  zone                = "${var.gcp_zone}"

  preemptible         = true
  source_image_family = "ubuntu-1804-lts"

  use_iap             = true
  ssh_username        = "packer"
}

source "googlecompute" "ubuntu-20" {
  disk_size           = 30

  image_description   = "Base Ubuntu image for GitLab Runner"
  image_family        = "gitlab-runner-ubuntu-20"
  image_name          = "gitlab-runner-ubuntu-20-${local.timestamp}"

  image_labels        = "${local.labels}"
  labels              = "${local.labels}"
  tags                = ["ssh", "packer"]

  project_id          = "${var.gcp_project}"
  network             = "projects/${var.gcp_project}/global/networks/${var.gcp_vpc}"
  subnetwork          = "${var.gcp_subnet}"
  zone                = "${var.gcp_zone}"

  preemptible         = true
  source_image_family = "ubuntu-2004-lts"

  use_iap             = true
  ssh_username        = "packer"
}

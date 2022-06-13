# packer-gitlab-runner

Packer configuration to build GitLab Runner instances.

These images were not tested fully yet, but due to the recent issues with OS updates and support for GitLab Runner and their specific Docker requirements, I created these images and I'm testing them to replace the default ones and also speed up a bit the launch of new machines for the runners.

## Requirements

To properly run this code you need to set a few things first:

* A GCP Project
* Enabled APIs:
    1. compute.googleapis.com
* A VPC with at least one subnet configured
    1. For best practice, delete the default VPC and create one manually with only the required subnet
* Firewall rule to enable IAP connection
    1. Target: `ssh` or `packer`
    2. IP Range: `35.235.240.0/20`
    3. Port: `22`
* A service account and downloaded key with the following permissions:
    1. From `Compute Admin` - Can be limited to the following permissions:
        * compute.disks.create
        * compute.disks.delete
        * compute.disks.useReadOnly
        * compute.globalOperations.get
        * compute.images.create
        * compute.images.get
        * compute.images.getFromFamily
        * compute.images.setLabels
        * compute.instances.create
        * compute.instances.delete
        * compute.instances.get
        * compute.instances.getSerialPortOutput
        * compute.instances.setLabels
        * compute.instances.setMetadata
        * compute.instances.setServiceAccount
        * compute.instances.setTags
        * compute.machineTypes.get
        * compute.subnetworks.use
        * compute.subnetworks.useExternalIp
        * compute.zoneOperations.get
        * compute.zones.get
    2. From `IAP-secured Tunnel User`
        * iap.tunnelInstances.accessViaIAP
    3. From `Service Account User`
        * iam.serviceAccounts.actAs
* Save the key locally. We are using a ServiceAccount with key to prevent requirement for the user permissions and to enable CI/CD

## Build

To build the images here, create a variables file and configure with desired values:

```hcl
-- prod.pkrvars.hcl
gcp_project = "your-project-id"
gcp_zone    = "us-central1-a"
gcp_vpc     = "your-vpc-id"
gcp_subnet  = "your-subnet-id"
```

Run the build command from Packer:

```bash
GOOGLE_APPLICATION_CREDENTIALS=<PATH TO YOUR DOWNLOADED KEY> packer build -var-file=prod.pkrvars.hcl .
```

This will create 3 images family:

* `gitlab-runner-debian`
* `gitlab-runner-ubuntu-18`
* `gitlab-runner-ubuntu-20`

Each image created will reference one day. If you need to create multiple images a day, change the `variables.pkr.hcl` file the format for `timestamp` local variable.

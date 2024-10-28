# terraform-infrastructure-template

Terraform template repository for infrastructures projects

## How to use this template

### Change the template name

In this template we use customized names to define ours project, but you need to change all the information, to be complaint with your project

Inside:

* terraform.tfvars

Change this informations

```ts
region="europe-west8-a"
clusterName="cluster-1"
diskSize=40
minNode=1
maxNode=3
machineType="e2-standard-4"

#### vpc.tf
network_name = "main"
network_routing_mode = "REGIONAL"
auto_create_subnetworks = false
mtu = 1460
delete_default_routes_on_create = false
region_vpc = "europe-west8"
subnet_name = "private"
subnet_ip_cidr_range = "10.0.0.0/18"
private_ip_google_access = true
secondary_ip_range_name = "k8s-pod-range"
secondary_ip_range_cidr = "10.0.64.0/18"
secondary_ip_service_range_name = "k8s-service-range"
secondary_ip_service_range_cidr = "10.0.128.0/22"
router_name = "router"
router_nat_name = "nat1"
nat_ip_ranges_source = "LIST_OF_SUBNETWORKS"
nat_ip_allocate_option = "MANUAL_ONLY"
subnetwork_source_ip = ["ALL_IP_RANGES"]
nat_address_name = "nat1"
nat_address_type = "EXTERNAL"
nat_address_network_tier = "PREMIUM"
firewalls_name = "allow-ssh"
firewalls_source_ranges = ["0.0.0.0/0"]

project_id = "k8s-project-412321"

### helm_release
argo_namespace = "argocd"
sealed_secrets_namespace = "kube-system"
```

### Terraform folders name convention

Inside the folder modules we have this folders(modules), that contains the terraform files. Here you can find the meaning of the folders

* networks: contains all the basic infrastructure that must be created before to support other layers, and cannot be destroyed every time.
  * for example we can find the vpc, subnets or firewalls
* helm_release: here you can find all the helm releases we want to install in.
* gke_cluster: here you can find the setup of your cluster for the eks
  * for example node and cluster it self 
* values: this directory contains the values.yaml for the helm releases

## Requirements

### 1. terraform

In order to manage the suitable version of terraform it is strongly recommended to install the following tool:

* **Terraform** .

Once this tool have been installed, check the terraform version :

```sh
    terraform --version
```

After installation install terraform:

you can then customize everything and watch the plan

```sh
    terraform plan
```

Then you can apply:
```sh
    terraform apply
```

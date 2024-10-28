variable "region" {
  description = "Deployment region"
  default = "europe-west8-a"
}
variable "clusterName" {
  description = "Name of our Cluster"
}
variable "diskSize" {
  description = "Node disk size in GB"
}
variable "minNode" {
  description = "Minimum Node Count"
}
variable "maxNode" {
  description = "maximum Node Count"
}
variable "machineType" {
  description = "Node Instance machine type"
}


####### from network module
variable "network_network" {
  description = "self link of the compute network created by the network module"
}

variable "network_subnetwork" {
  description = "self link of the compute sub network created by the network module"
}

variable "project_id" {
  description = "project id"
}
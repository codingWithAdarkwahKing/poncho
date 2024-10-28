module "networks" {
  source = "./modules/networks"
  network_name                 = var.network_name
  network_routing_mode         = var.network_routing_mode
  auto_create_subnetworks      = var.auto_create_subnetworks
  mtu                          = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
  region_vpc = var.region_vpc
  
  subnet_name                  = var.subnet_name
  subnet_ip_cidr_range         = var.subnet_ip_cidr_range
  private_ip_google_access     = var.private_ip_google_access
  secondary_ip_range_name      = var.secondary_ip_range_name
  secondary_ip_range_cidr      = var.secondary_ip_range_cidr
  secondary_ip_service_range_name = var.secondary_ip_service_range_name
  secondary_ip_service_range_cidr = var.secondary_ip_service_range_cidr

  router_name                  = var.router_name

  router_nat_name              = var.router_nat_name
  nat_ip_ranges_source         = var.nat_ip_ranges_source
  nat_ip_allocate_option       = var.nat_ip_allocate_option
  subnetwork_source_ip         = var.subnetwork_source_ip
  nat_address_name             = var.nat_address_name
  nat_address_type             = var.nat_address_type
  nat_address_network_tier     = var.nat_address_network_tier

  firewalls_name               = var.firewalls_name
  firewalls_source_ranges      = var.firewalls_source_ranges
}


module "gke_cluster" {
  source = "./modules/gke_cluster"

  region       = var.region
  clusterName  = var.clusterName
  diskSize     = var.diskSize
  minNode      = var.minNode
  maxNode      = var.maxNode
  machineType  = var.machineType
  network_network = module.networks.compute_network
  network_subnetwork = module.networks.compute_subnetwork
  project_id = var.project_id
}

module "helm_release" {
  source = "./modules/helm_release"
  argo_namespace = var.argo_namespace
  sealed_secrets_namespace = var.sealed_secrets_namespace
}
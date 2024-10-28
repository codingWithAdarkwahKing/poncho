resource "google_compute_network" "main" {
  name                            = var.network_name
  routing_mode                    = var.network_routing_mode
  auto_create_subnetworks         = var.auto_create_subnetworks
  mtu                             = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
}
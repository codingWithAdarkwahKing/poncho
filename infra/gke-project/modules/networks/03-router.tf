resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region_vpc
  network = google_compute_network.main.id
}
resource "google_compute_router_nat" "nat" {
  name   = var.router_nat_name
  router = google_compute_router.router.name
  region = var.region_vpc

  source_subnetwork_ip_ranges_to_nat = var.nat_ip_ranges_source
  nat_ip_allocate_option             = var.nat_ip_allocate_option

  subnetwork {
    name                    = google_compute_subnetwork.private.id
    source_ip_ranges_to_nat = var.subnetwork_source_ip
  }

  nat_ips = [google_compute_address.nat.self_link]
}

resource "google_compute_address" "nat" {
  name         = var.nat_address_name
  address_type = var.nat_address_type
  network_tier = var.nat_address_network_tier

  region       = var.region_vpc 

}
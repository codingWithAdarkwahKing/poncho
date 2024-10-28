resource "google_compute_subnetwork" "private" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_ip_cidr_range
  region                   = var.region_vpc
  network                  = google_compute_network.main.id
  private_ip_google_access = var.private_ip_google_access

  secondary_ip_range {
    range_name    = var.secondary_ip_range_name
    ip_cidr_range = var.secondary_ip_range_cidr
  }
  secondary_ip_range {
    range_name    = var.secondary_ip_service_range_name
    ip_cidr_range = var.secondary_ip_service_range_cidr
  }
}

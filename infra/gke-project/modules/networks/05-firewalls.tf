resource "google_compute_firewall" "allow-ssh" {
  name    = var.firewalls_name
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.firewalls_source_ranges
}
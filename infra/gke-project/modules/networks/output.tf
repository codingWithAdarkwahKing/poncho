output "compute_network" {
  value = google_compute_network.main.self_link
}

output "compute_subnetwork" {
  value = google_compute_subnetwork.private.self_link
}
resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.clusterName} --zone ${var.region} --project ${var.project_id}"
  }
  provisioner "local-exec" {
    command = "kubectl config use-context gke_${var.project_id}_${var.region}_${var.clusterName}"
  }

  depends_on = [google_container_cluster.gke_cluster]
}
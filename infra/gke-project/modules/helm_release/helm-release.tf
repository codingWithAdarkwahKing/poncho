resource "helm_release" "sealed_secrets" {
  name       = "sealed-secrets"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "sealed-secrets"
  version    = "1.8.3"
  namespace  = var.sealed_secrets_namespace
  wait          = true
  wait_for_jobs = true
  create_namespace = false

}

# resource "helm_release" "ingress-nginx" {
#   name = "controller"
#   chart = "ingress-nginx"
#   repository = "https://kubernetes.github.io/ingress-nginx"
#   version = "4.9.1"
#   namespace = "ingress"
#   create_namespace = true
#   cleanup_on_fail = true

#   values = [ 
#     "${file("./values/ingress-nginx-values.yaml")}"
#    ]

#   wait          = true
#   wait_for_jobs = true
# }


# resource "helm_release" "cert-manager" {
#   name = "cert-manager"
#   chart = "cert-manager"
#   repository = "https://charts.jetstack.io"
#   version = "1.13.3"
#   namespace = "cert-manager"
#   create_namespace = true
#   cleanup_on_fail = true

#   values = [ 
#     "${file("./values/cert-manager-values.yaml")}"
#    ]

#   wait          = true
#   wait_for_jobs = true
# }


# resource "helm_release" "elasticsearch" {
#   name = "elasticsearch"
#   chart = "elasticsearch"
#   repository = "https://charts.bitnami.com/bitnami"
#   version = "19.17.5"
#   namespace = "efk"
#   create_namespace = true
#   cleanup_on_fail = true

#   values = [ 
#     "${file("./values/elasticsearch-values.yaml")}"
#    ]

#   wait          = true
# }


# resource "helm_release" "kibana" {
#   name = "kibana"
#   chart = "kibana"
#   repository = "https://charts.bitnami.com/bitnami"
#   version = "10.9.0"
#   namespace = "efk"
#   create_namespace = true
#   cleanup_on_fail = true

#   values = [ 
#     "${file("./values/kibana-values.yaml")}"
#    ]

#   wait          = true
# }


# resource "helm_release" "fluentd" {
#   name = "fluentd"
#   chart = "fluentd"
#   repository = "https://charts.bitnami.com/bitnami"
#   version = "5.15.1"
#   namespace = "efk"
#   create_namespace = true
#   cleanup_on_fail = true

#   values = [ 
#     "${file("./values/fluentd-values.yaml")}"
#    ]

#   wait          = true
# }

# resource "helm_release" "kube_prometheus_stack" {
#   name       = "kube-prometheus-stack"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "kube-prometheus-stack"
#   version    = "12.8.0"
#   namespace  = "kube-prometheus-stack"
#   create_namespace = true
#   cleanup_on_fail = true

#   values = [
#     "${file("./values/kube-prometheus-stack-values.yaml")}"
#   ]

#   wait          = true
# }

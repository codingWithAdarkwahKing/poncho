# resource "kubernetes_namespace" "argo" {
#   metadata {
#     name = var.argo_namespace
#   }
# }


resource "helm_release" "argocd" {
  # depends_on = [kubernetes_namespace.argo]
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.36.7"
  namespace  = var.argo_namespace
  create_namespace = true

  values = [ 
    "${file("./values/argo-cd-values.yaml")}"
  ]

  wait          = true
  wait_for_jobs = true
}

# resource "kubectl_manifest" "gh_private_repo_key" {
#   depends_on = [helm_release.sealed_secrets]
#   yaml_body = file("sealed-ssh-secret.yaml")
# }

# resource "kubernetes_secret_v1" "argo_config_repo" {
#   metadata {
#     name      = "argocd-config-repo"
#     namespace = var.argo_namespace
#     labels = {
#       "argocd.argoproj.io/secret-type" = "repository"
#     }
#   }
#   data = {
#     name          = "argocd-config"
#     type          = "git"
#     url           = "<argo-config-repository-url>"
#     sshPrivateKey = "${file("~/.ssh/id_ed25519")}"
#   }
# }

# resource "kubectl_manifest" "application_argo_config" {
#   depends_on = [kubernetes_secret_v1.argo_config_repo]
#   yaml_body = yamlencode({
#     apiVersion = "argoproj.io/v1alpha1"
#     kind       = "Application"
#     metadata = {
#       name      = "argo-config"
#       namespace = var.argo_namespace
#     }
#     spec = {
#       destination = {
#         server = "https://kubernetes.default.svc"
#       }
#       project = "default"
#       sources = [
#         {
#           path           = "./"
#           repoURL        = "<argo-config-repository-url>"
#           targetRevision = "main"
#         }
#       ],
#       syncPolicy = {
#         automated = {
#           prune    = true
#           selfHeal = false
#         }
#       }
#     }
#   })
# }
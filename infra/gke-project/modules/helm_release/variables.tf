variable "argo_namespace" {
  description = "The namespace where ArgoCD will be installed."
  type        = string
}

variable "sealed_secrets_namespace" {
  description = "The namespace where sealed-secrets will be installed."
  type        = string
}
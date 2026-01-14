output "argocd_password" {
  value     = try(data.kubernetes_secret.argocd_admin_secret.data["password"], "")
  sensitive = true
}

output "argocd_url" {
  value = try(data.kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].hostname, "")
}

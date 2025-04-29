# Creates Helm Release
resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  timeout          = 600
  create_namespace = true
  version          = "4.7.0"
}

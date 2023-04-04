resource "kubernetes_namespace" "manage" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress_nginx_controller" {
  name = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"
  version = "4.4.0"
  namespace = kubernetes_namespace.manage.id
  set {
    name = "controller.extraArgs.enable-ssl-passthrough"
    value = ""
  }
}
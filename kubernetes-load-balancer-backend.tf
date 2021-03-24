resource "kubernetes_service" "backend-service" {
  metadata {
    name      = "cloud-ninja-backend"
    namespace = kubernetes_namespace.n.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.backend-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}


output "backend_lb_status" {
  value = kubernetes_service.backend-service.status
}

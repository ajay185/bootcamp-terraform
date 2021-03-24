resource "kubernetes_deployment" "si-deployment" {
  metadata {
    name = "cloud-ninja-frontend"
    labels = {
      App = "frontend"
    }
    namespace = kubernetes_namespace.n.metadata[0].name
  }

  spec {
    replicas                  = 3
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "cloud-ninja-frontend"
      }
    }
    template {
      metadata {
        labels = {
          App = "cloud-ninja-frontend"
        }
      }
      spec {
        container {
          image = "ajay185/frontend:v2.0"
          name  = "cloud-ninja-frontend"

          port {
            container_port = 8081
          }

          resources {
            limits = {
              cpu    = "0.2"
              memory = "2562Mi"
            }
            requests = {
              cpu    = "0.1"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
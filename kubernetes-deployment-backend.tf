resource "kubernetes_deployment" "backend-deployment" {
  metadata {
    name = "cloud-ninja-backend"
    labels = {
      App = "backend"
    }
    namespace = kubernetes_namespace.n.metadata[0].name
  }

  spec {
    replicas                  = 3
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "cloud-ninja-backend"
      }
    }
    template {
      metadata {
        labels = {
          App = "cloud-ninja-backend"
        }
      }
      spec {
        container {
          image = "ajay185/backend:v1.0.1"
          name  = "cloud-ninja-backend"

          port {
            container_port = 8080
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
resource "google_cloud_run_v2_service" "customer_api" {

  name     = "customer-api"
  location = var.region

  ingress = "INGRESS_TRAFFIC_ALL"

  template {

    service_account = google_service_account.customer_api.email

    containers {

      image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact_registry_name}/customer-api:latest"

      ports {
        container_port = 8080
      }

      resources {

        limits = {
          cpu    = "1"
          memory = "512Mi"
        }

      }
    }
  }

  traffic {
    percent = 100
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }

}
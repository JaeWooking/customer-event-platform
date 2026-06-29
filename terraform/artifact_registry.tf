resource "google_artifact_registry_repository" "docker_repo" {

  location = var.region

  repository_id = var.artifact_registry_name

  description = "Docker images"

  format = "DOCKER"
}
resource "google_project_iam_member" "artifact_reader" {
  project = var.project_id
  role = "roles/artifactregistry.reader"
  member = "serviceAccount:${google_service_account.customer_api.email}"
}

resource "google_project_iam_member" "pubsub_publisher" {
  project = var.project_id
  role = "roles/pubsub.publisher"
  member = "serviceAccount:${google_service_account.customer_api.email}"
}

resource "google_project_iam_member" "bigquery_editor" {
  project = var.project_id
  role = "roles/bigquery.dataEditor"
  member = "serviceAccount:${google_service_account.customer_api.email}"
}

data "google_project" "current" {
  project_id = var.project_id
}

resource "google_pubsub_topic_iam_member" "dlq_publisher" {
  topic = google_pubsub_topic.customer_events_dlq.name
  role = "roles/pubsub.publisher"
  member = "serviceAccount:service-${data.google_project.current.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}
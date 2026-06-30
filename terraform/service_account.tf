resource "google_service_account" "customer_api" {

  account_id   = "customer-api"

  display_name = "Customer API Service Account"

}

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
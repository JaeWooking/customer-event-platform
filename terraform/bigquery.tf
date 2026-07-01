resource "google_bigquery_dataset" "analytics" {
    dataset_id = "analytics"
}

resource "google_bigquery_table" "customer_events" {
  dataset_id = google_bigquery_dataset.analytics.dataset_id
  table_id = "customer_events"
  deletion_protection = false
  schema = jsonencode([
    {
      name = "event_id"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "event_time"
      type = "TIMESTAMP"
      mode = "REQUIRED"
    },
    {
      name = "event_name"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "user_id"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "session_id"
      type = "STRING"
      mode = "NULLABLE"
    },
    {
      name = "properties"
      type = "JSON"
      mode = "NULLABLE"
    }
  ])
}
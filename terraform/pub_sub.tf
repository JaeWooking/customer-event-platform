resource "google_pubsub_topic" "customer_events" {
  name = "customer-events"
}

resource "google_pubsub_subscription" "customer_events_sub" {
  name  = "customer-events-sub"

  topic = google_pubsub_topic.customer_events.id

  ack_deadline_seconds = 20
}
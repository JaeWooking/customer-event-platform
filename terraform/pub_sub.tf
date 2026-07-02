resource "google_pubsub_topic" "customer_events" {
  name = "customer-events"
}

resource "google_pubsub_subscription" "customer_events_sub" {
  name  = "customer-events-sub"
  topic = google_pubsub_topic.customer_events.id
  ack_deadline_seconds = 20

  dead_letter_policy {
    dead_letter_topic = google_pubsub_topic.customer_events_dlq.id
    max_delivery_attempts = 5
  }
  
  depends_on = [
    google_pubsub_topic.customer_events_dlq,
    google_pubsub_topic_iam_member.dlq_publisher
  ]
}

resource "google_pubsub_topic" "customer_events_dlq" {
  name = "customer-events-dlq"
}


resource "google_pubsub_subscription" "customer_events_dlq_sub" {
  name = "customer-events-dlq-sub"
  topic = google_pubsub_topic.customer_events_dlq.id
  ack_deadline_seconds = 20
}


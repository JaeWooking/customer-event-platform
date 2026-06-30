terraform {

  backend "gcs" {

    bucket = "elite-partition-240511-tfstate"

    prefix = "customer-event-platform"

  }

}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.0.0"
    }
  }
}

provider "google" {
  project = "nextjs-cloud-run-332117"
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
}

resource "google_cloud_run_service" "nextjs-service" {
  name     = "nextjs-service"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/nextjs-cloud-run-332117/web"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.run]
}

resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.nextjs-service.name
  location = google_cloud_run_service.nextjs-service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "url" {
  value = "${google_cloud_run_service.nextjs-service.status[0].url}"
}

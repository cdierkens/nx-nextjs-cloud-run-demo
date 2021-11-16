output "url" {
  value = "${google_cloud_run_service.nextjs-service.status[0].url}"
}

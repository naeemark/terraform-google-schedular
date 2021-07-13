terraform {
  required_version = ">= 0.13.1"
}

resource "google_cloud_scheduler_job" "job" {
  project          = var.project
  region           = var.region
  name             = format("%s-%s", var.job_name, var.name_suffix)
  description      = var.description
  schedule         = var.schedule
  time_zone        = var.time_zone
  attempt_deadline = var.attempt_deadline

  retry_config {
    retry_count          = var.retry_config.retry_count
    max_doublings        = var.retry_config.max_doublings
    max_retry_duration   = var.retry_config.max_retry_duration
    min_backoff_duration = var.retry_config.min_backoff_duration
    max_backoff_duration = var.retry_config.max_backoff_duration
  }

  http_target {
    http_method = var.http_target_method
    uri         = var.http_target_url
    oidc_token {
      audience              = var.oidc_auth_audience
      service_account_email = var.oidc_auth_sa_email
    }
  }
}
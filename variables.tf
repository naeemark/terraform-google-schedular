variable "project" {
  description = "Google Cloud Project"
}
variable "name_suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.name_suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}
variable "job_name" {
  description = "The name for Clod Schedler Job."
  type        = string
}

variable "description" {
  description = "A description string for the Job."
  type        = string
  default     = ""
}

variable "time_zone" {
  description = "TimeZone for the frequenct clock"
  type        = string
  default     = "Asia/Kuala_Lumpur"
}

variable "schedule" {
  description = "Cron Schedule"
  type        = string
}

variable "attempt_deadline" {
  default = "320s"
  type    = string
}

variable "region" {
  description = "Region for Cron Schedler Job"
  type        = string
  default     = "asia-east2"
}

variable "retry_config" {
  description = "Retry configutarions for the job"
  type        = map
  default = {
    retry_count          = 3
    max_doublings        = 5
    max_retry_duration   = "10s"
    min_backoff_duration = "5s"
    max_backoff_duration = "320s"
  }
}

variable "http_target_method" {
  description = "Target HTTP Methon"
  type        = string
  default     = "GET"
}

variable "http_target_url" {
  description = "Target URL path string"
  type        = string
}

variable "oidc_auth_sa_email" {
  description = "Service Account email for OIDC Auth Token"
  type        = string
}

variable "oidc_auth_audience" {
  description = "A string to be validated as Auth Audience"
  type        = string
}
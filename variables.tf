variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "github_user" {
  description = "git hub user to run pipeline"
  type = string
}

variable "github_repo" {
  description = "github repository to run pipeline."
  type = string
}
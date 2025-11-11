variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime (e.g. python3.11)"
  type        = string
}

variable "handler" {
  description = "Lambda handler"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN to publish to"
  type        = string
}

variable "sqs_queue_arn" {
  description = "SQS queue ARN for trigger"
  type        = string
}

variable "sqs_queue_url" {
  description = "SQS queue URL (not used directly but useful for outputs)"
  type        = string
}
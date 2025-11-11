output "lambda_function_name" {
  value = module.lambda.function_name
}

output "sns_topic_arn" {
  value = module.sns.topic_arn
}

output "sqs_queue_url" {
  value = module.sqs.queue_url
}
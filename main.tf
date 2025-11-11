provider "aws" {
  region = var.region
}

module "sns" {
  source           = "./modules/sns"
  topic_name       = "sqs-to-sns-topic"
  email_subscribers = ["your.email@example.com"] # you’ll need to confirm via email
}

module "sqs" {
  source      = "./modules/sqs"
  queue_name  = "sqs-trigger-queue"
}

module "lambda" {
  source           = "./modules/lambda"
  function_name    = "sqs-to-sns-logger"
  runtime          = "python3.11"
  handler          = "lambda_function.lambda_handler"
  sns_topic_arn    = module.sns.topic_arn
  sqs_queue_arn    = module.sqs.queue_arn
  sqs_queue_url    = module.sqs.queue_url
}
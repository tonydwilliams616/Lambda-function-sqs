import json
import boto3
import logging
import os

# Configure logging (goes to CloudWatch automatically)
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Initialize SNS client
sns_client = boto3.client("sns")

# Environment variable for SNS Topic ARN
SNS_TOPIC_ARN = os.environ.get("SNS_TOPIC_ARN")

def lambda_handler(event, context):
    """
    Lambda triggered by SQS messages.
    1. Logs message to CloudWatch.
    2. Publishes message to SNS topic.
    """
    logger.info("Received SQS event: %s", json.dumps(event))

    for record in event.get("Records", []):
        message_body = record.get("body", "")
        logger.info("Processing SQS message: %s", message_body)

        try:
            response = sns_client.publish(
                TopicArn=SNS_TOPIC_ARN,
                Message=message_body,
                Subject="New SQS Message Triggered Event"
            )
            logger.info("Message published to SNS topic: %s", response["MessageId"])
        except Exception as e:
            logger.error("Failed to publish to SNS: %s", str(e))

    return {
        "statusCode": 200,
        "body": json.dumps("SQS messages processed successfully!")
    }
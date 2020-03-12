import logging
import json
from jose import jwt

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)


def lambda_handler(event, context):
    logger.debug("Add Note Lambda")
    logger.debug(f"Event: {event}")

    try:
        if 'headers' not in event:
            raise Exception("event is missing 'headers' section")
        if 'token' not in event['headers']:
            raise Exception("event['headers'] is missing 'token' section")
        if 'body' not in event:
            raise Exception("event is missing 'body' section")

        token = event['headers']['token']
        body = event['body']

        claims = jwt.get_unverified_claims(token)
        email = claims['email']

        logger.debug(f"Add Note: {body} for email: {email}")

        return {
            "statusCode": 200,
            "body": json.dumps(f"Add Note for email: {email}. Success")
        }
    except Exception as exc:
        return {
            "statusCode": 500,
            "body": json.dumps(f"Error in processing request. {exc}")
        }

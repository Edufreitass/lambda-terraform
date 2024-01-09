from aws_lambda_powertools import Logger

from src.http import request

logger = Logger()


@logger.inject_lambda_context(log_event=True)
def lambda_handler(event: dict, context: object) -> dict:
    logger.info('Starting lambda processing..')
    try:
        api_response = request.make_request(event)
    except Exception as e:
        logger.exception(f'Lambda processing failure: {e}')
        raise e
    else:
        status_code = api_response.status_code
        body = api_response.json()
        response = {
            'statusCode': status_code,
            'body': body
        }
        return response
    finally:
        logger.info('Finishing lambda processing..')

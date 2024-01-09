import requests

from aws_lambda_powertools import Logger
from requests import HTTPError

logger = Logger()


def make_request(event: dict):
    try:
        user_id = event.get('user_id', '')
        url = f'https://jsonplaceholder.typicode.com/users/{user_id}'

        logger.info(f'Making request to {url}')
        response = requests.get(url=url)
        response.raise_for_status()
    except HTTPError as e:
        logger.exception(f'An HTTPError occurred: {e}')
        raise e
    except Exception as e:
        logger.exception(f'An unknown error occurred during the request: {e}')
        raise e
    else:
        logger.info('Request made successfully')
        return response

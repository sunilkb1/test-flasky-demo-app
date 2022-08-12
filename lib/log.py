"""
Logging decorator which can be used with tests to indicate the running of the test.
"""

import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s [%(levelname)8s] %(message)s (%(filename)s:%(lineno)s)')
stream_handler = logging.StreamHandler()
stream_handler.setFormatter(formatter)
logger.addHandler(stream_handler)


def log(func):
    """
    Logging function which log the test name each time its run
    Further enchacement possible to collect more info on failures
    :param func:
    :return:
    """
    def wrapper(*args, **kwargs):
        try:
            logger.info(f"\n****************** Running Test {func.__name__} ******************")
            ret_val = func(*args, **kwargs)
            logger.info(f"\n****************** Ending Test {func.__name__} ******************")
            return ret_val
        except Exception as ex:
            logger.exception(f"Exception raised in {func.__name__}. exception: {str(ex)}")
            raise ex
    return wrapper

import logging

logging.basicConfig(format=u'%(filename)s [LINE:%(lineno)d] #%(levelname)-8s [%(asctime)s]  %(message)s',
                    level=logging.INFO,
                    # level=logging.DEBUG,
                    # filename='mylogtest.log',
                    )

# file_log = logging.FileHandler('Log.log')
# console_out = logging.StreamHandler()

# logging.basicConfig(handlers=(file_log, console_out), 
#                     format='[%(asctime)s | %(levelname)s]: %(message)s', 
#                     datefmt='%m.%d.%Y %H:%M:%S',
#                     level=logging.INFO)

# logging.info('Info message??))')
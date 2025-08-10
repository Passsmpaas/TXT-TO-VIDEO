# DON'T add anything here just add in render's secret or env section 
from os import environ

API_ID = int(environ.get("API_ID", "22470912"))
API_HASH = environ.get("API_HASH", "511be78079ed5d4bd4c967bc7b5ee023")
BOT_TOKEN = environ.get("BOT_TOKEN", "")


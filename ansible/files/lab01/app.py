from flask import Flask, request
import json
import os
from datetime import datetime

REQUESTS_DIR = "/data/requests"

app = Flask(__name__)

def create_dir_if_not_exists(directory):
  if not os.path.exists(directory):
    os.makedirs(directory)

@app.route('/')
def index():
    date_str = datetime.now().strftime("%Y-%m-%d")
    dir_path = f"{REQUESTS_DIR}/{date_str}"

    if not os.path.exists(dir_path):
        os.makedirs(dir_path)

    file_name = datetime.now().strftime("%Y%m%d%H%M%S%f") + ".json"
    file_path = os.path.join(dir_path, file_name)

    with open(file_path, 'w') as file:
        payload = {"success": True}
        json.dump(payload, file)

    return f"Hello, World!"

if __name__ == '__main__':
    try:
        create_dir_if_not_exists(REQUESTS_DIR)
        app.run(port=5000)
    except Exception as e:
        print(e)
from flask import Flask
from app.controller import APIController

app = Flask(__name__)
controller = APIController()

@app.route('/', methods=['GET'])
def main():
    return "Navigate to the /hello/{name} pages to see the app!"

@app.route('/hello/<name>', methods=['GET'])
def hello(name):
    return controller.hello(name)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

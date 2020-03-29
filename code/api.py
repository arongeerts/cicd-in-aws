from flask import Flask

app = Flask(__name__)


@app.route('/', methods=['GET'])
def main():
    return "Navigate to the /hello/{name} pages to see the app!"


@app.route('/hello/<name>', methods=['GET'])
def hello(name):
    return "Hello {}!".format(name.title())


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

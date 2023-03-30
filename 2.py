from flask import Flask, request

app = Flask(__name__)

@app.route('/group', methods=['POST'])
def func1():
    return 1



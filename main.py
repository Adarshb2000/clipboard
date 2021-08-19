from pyperclip import paste
from flask import Flask, render_template


app = Flask(__name__)

ip = '192.168.43.41'

@app.route('/')
def index():
    return paste()


if __name__ == '__main__':
    app.run(host=ip, debug=True)
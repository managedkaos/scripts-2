#python 3 thread example
#pip install flask
#pip install flask-socketio

from flask import Flask, request, send_from_directory
from flask_socketio import SocketIO
from flask_socketio import send, emit
from random import randint
from threading import Lock
import time

app = Flask(__name__, static_url_path='')
socketio = SocketIO(app, async_mode=None)
thread = None
thread_lock = Lock()

@app.route('/static/<path:path>')
def send_js(path):
    return send_from_directory('static', path)

def background_thread():
    while True:
        socketio.send("processing.. "+str(randint(0, 100)))
        socketio.sleep(1)

@socketio.on('startBroadcasting')
def startBroadcasting():
    global thread
    with thread_lock:
        if thread is None:
            thread = socketio.start_background_task(target=background_thread)

@socketio.on('ping')
def pingpong():
    print("sending pong")
    send("pong")

if __name__ == '__main__':
    socketio.run(app)

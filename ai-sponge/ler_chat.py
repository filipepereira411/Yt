import sys
import threading
from flask import Flask, jsonify
from flask_cors import CORS
import pytchat
app = Flask(__name__)
CORS(app)
msg_list = []
def get_yt_chat(vid):
    global msg_list
    try:
        chat = pytchat.create(video_id=vid)
        print("[LIVE] Ligado com sucesso ao YouTube!")
        while chat.is_alive():
            for c in chat.get().sync_items():
                msg_list.append({"author": c.author.name, "message": c.message, "color": "#54a0ff"})
                print(f"[{c.author.name}]: {c.message}")
                if len(msg_list) > 30: msg_list.pop(0)
    except Exception as e: print(f"Erro: {e}")
@app.route('/get_messages', methods=['GET'])
def get_messages():
    global msg_list
    data = list(msg_list)
    msg_list.clear()
    return jsonify(data)
if __name__ == '__main__':
    thread = threading.Thread(target=get_yt_chat, args=(sys.argv[1],), daemon=True)
    thread.start()
    app.run(port=5000, debug=False, use_reloader=False)

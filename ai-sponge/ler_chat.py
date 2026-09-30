import sys
import threading
import json
from flask import Flask, jsonify
from flask_cors import CORS
import pytchat

app = Flask(__name__)
CORS(app)  # Permite que o teu HTML leia os dados localmente

# Armazena as ultimas mensagens capturadas do YouTube
mensagens_acumuladas = []

def capturar_chat_youtube(video_id):
    global mensagens_acumuladas
    try:
        chat = pytchat.create(video_id=video_id)
        print(f"[LIVE] Conectado com sucesso ao chat da live {video_id}!")
        
        while chat.is_alive():
            for c in chat.get().sync_items():
                msg_data = {
                    "author": c.author.name,
                    "message": c.message,
                    "color": "#ff4757" if c.author.isChatModerator else "#54a0ff"
                }
                mensagens_acumuladas.append(msg_data)
                print(f"[{c.author.name}]: {c.message}")
                
                # Mantem apenas as ultimas 30 mensagens para nao sobrecarregar
                if len(mensagens_acumuladas) > 30:
                    mensagens_acumuladas.pop(0)
    except Exception as e:
        print(f"[ERRO] Falha ao ler o chat: {e}")

@app.route('/get_messages', methods=['GET'])
def get_messages():
    global mensagens_acumuladas
    # Envia as mensagens e limpa a lista local para nao duplicar no HTML
    dados_a_enviar = list(mensagens_acumuladas)
    mensagens_acumuladas.clear()
    return jsonify(dados_a_enviar)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Erro: ID da live nao fornecido.")
        sys.exit(1)
        
    id_da_live = sys.argv[1]
    
    # Inicia a captura do chat numa thread separada
    thread_chat = threading.Thread(target=capturar_chat_youtube, args=(id_da_live,), daemon=True)
    thread_chat.start()
    
    # Inicia o servidor local na porta 5000 para o HTML se conectar
    app.run(port=5000, debug=False, use_reloader=False)

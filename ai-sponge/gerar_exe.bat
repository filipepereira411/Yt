@echo off
title AI Sponge Automatic Connector - @AgentFOwca
color 0A
cls

echo ===================================================
echo   AI SPONGE - CONFIGURADOR AUTOMÁTICO DO @AgentFOwca
echo ===================================================
echo.

:: Garante que o terminal está a rodar na pasta correta
cd /d "%~dp0"

echo [1/3] A verificar dependencias do Python...
pip install pytchat flask flask-cors --quiet

echo [2/3] A reconstruir o ficheiro de ligacao (ler_chat.py)...
:: Este comando recria o script Python em falta automaticamente na pasta
(
echo import sys
echo import threading
echo from flask import Flask, jsonify
echo from flask_cors import CORS
echo import pytchat
echo app = Flask^(__name__^)
echo CORS^(app^)
echo msg_list = []
echo def get_yt_chat^(vid^):
echo     global msg_list
echo     try:
echo         chat = pytchat.create^(video_id=vid^)
echo         print^("[LIVE] Ligado com sucesso ao YouTube!"^)
echo         while chat.is_alive^(^):
echo             for c in chat.get^(^).sync_items^(^):
echo                 msg_list.append^({"author": c.author.name, "message": c.message, "color": "#54a0ff"}^)
echo                 print^(f"[{c.author.name}]: {c.message}"^)
echo                 if len^(msg_list^) ^> 30: msg_list.pop^(0^)
echo     except Exception as e: print^(f"Erro: {e}"^)
echo @app.route^('/get_messages', methods=['GET']^)
echo def get_messages^(^):
echo     global msg_list
echo     data = list^(msg_list^)
echo     msg_list.clear^(^)
echo     return jsonify^(data^)
echo if __name__ == '__main__':
echo     thread = threading.Thread^(target=get_yt_chat, args=^(sys.argv[1],^), daemon=True^)
echo     thread.start^(^)
echo     app.run^(port=5000, debug=False, use_reloader=False^)
) > ler_chat.py

echo [3/3] A ligar o chat à tua transmissão vPPmFxstsw0...
echo.
echo ---------------------------------------------------
echo JA ESTA! DEIXA ESTA JANELA ABERTA ENQUANTO TRANSMITES
echo ---------------------------------------------------
echo.

python ler_chat.py vPPmFxstsw0

pause
exit

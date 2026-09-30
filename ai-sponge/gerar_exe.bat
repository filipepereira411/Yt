@echo off
title AI Sponge Connector - @AgentFOwca
color 0A
cls

echo ===================================================
echo   AI SPONGE - CONFIGURADOR DE CONEXAO DO @AgentFOwca
echo ===================================================
echo.

:: Instala as bibliotecas de Python necessarias para ler o chat do YouTube
echo [1/3] A verificar e instalar dependencias do Python...
pip install pytchat flask flask-cors --quiet

:: Abre o teu simulador HTML automaticamente no teu navegador
echo [2/3] A abrir o Simulador AI Sponge no navegador...
start "" "index.html"

echo [3/3] A ligar ao Chat da sua Live do YouTube...
echo ID da Transmissao: vPPmFxstsw0
echo.
echo ===================================================
echo   A CONEXAO ESTA ATIVA! DEIXE ESTA JANELA ABERTA
echo ===================================================
echo.

:: Executa o script Python passando o ID exato da tua live que estava na imagem
python ler_chat.py vPPmFxstsw0

pause
exit

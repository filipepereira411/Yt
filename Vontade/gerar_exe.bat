@echo off
:: Altera o título da janela da linha de comandos
title Conexao AI Sponge - YouTube Live

:: Configuração de cores (0A = Fundo preto com letras verdes estilo terminal)
color 0A

echo ===================================================
echo   INICIANDO SIMULADOR AI SPONGE - CONEXAO LIVE
echo ===================================================
echo.
echo A ligar os scripts locais a transmissao do YouTube...
echo Por favor, aguarde um momento.
echo.

:: Substitui o link abaixo pelo URL real do teu canal ou da tua stream live
set URL_YOUTUBE=https://www.youtube.com/@AgentFOwca
:: Abre o navegador predefinido diretamente no link configurado
start "" "%URL_YOUTUBE%"

echo.
echo [SUCESSO] Navegador aberto em: %URL_YOUTUBE%
echo Podes fechar esta janela ou premir qualquer tecla para sair.
echo ===================================================
pause > nul
exit

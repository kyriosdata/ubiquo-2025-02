@echo off
chcp 65001

set FILE=%TEMP%\plantuml-asl-1.2024.6.jar
set URL=https://github.com/plantuml/plantuml/releases/download/v1.2024.6/plantuml-asl-1.2024.6.jar

:: Verifica se o arquivo existe
if exist "%FILE%" (
    echo Plantuml disponível.
) else (
    echo O arquivo %FILE% não existe. Baixando...
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%URL%', 'plantuml-asl-1.2024.6.jar')"
    move plantuml-asl-1.2024.6.jar %TEMP%
    echo Download concluído.
)

echo Produzindo arquivos PNG a partir de arquivos no Plantuml. Aguarde ...
java -jar "%FILE%" .
echo Geração de arquivos concluída.

#!/bin/bash

# Nome do diretório temporário
temp_dir="packages"
# Nome do diretório de dependências
depend_dir="python"
# Nome do arquivo resources de saída
output_zip="lambda_layer.zip"
# Caminho do arquivo requirements.txt
requirements_path="../../../../app/requirements.txt"
# Caminho do arquivo zip
zip_path="../../zip/"

echo "### Iniciando script ###"
echo "Criando diretório '$temp_dir'"
mkdir "$temp_dir"
echo "Entrando no diretório '$temp_dir'"
cd "$temp_dir"
echo "Criando ambiente virtual 'venv'"
python3 -m venv venv
echo "Ativando ambiente virtual"
source venv/bin/activate
echo "Criando diretório '$depend_dir'"
mkdir "$depend_dir"
echo "Entrando no diretório '$depend_dir'"
cd "$depend_dir"
echo "Executando 'pip install..' no arquivo 'requirements.txt'"
pip install -r "$requirements_path" -t .
echo "Removendo arquivos com extensão .dist-info"
rm -rf *dist-info
echo "Saindo do diretório '$depend_dir'"
cd ..
echo "Desativando ambiente virtual"
deactivate
echo "Criando arquivo zip"
zip -r "$zip_path""$output_zip" "$depend_dir"
echo "Arquivo zip '$output_zip' criado com sucesso"
cd ..
echo "Removendo diretório '$depend_dir'"
rm -rf "$temp_dir"
echo "### Encerrando script ###"

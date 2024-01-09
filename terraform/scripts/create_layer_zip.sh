#!/bin/bash

# Nome do diretório temporário
temp_dir="temp"

# Nome do arquivo resources de saída
output_zip="lambda_layer.zip"

echo "Criando diretório temporário..."
# Criar diretório temporário
mkdir "$temp_dir"

echo "Instalando python3.10-venv"
apt install python3.10-venv

echo "Instalando dependências em um ambiente virtual temporário..."
# Instalar as dependências em um ambiente virtual temporário
python3 -m venv "$temp_dir/.venv"
source "$temp_dir/.venv/bin/activate"
pip install -q -r requirements.txt

echo "Copiando dependências para o diretório temporário..."
# Copiar as dependências para o diretório temporário
cp -r "$temp_dir/.venv/lib/python3.*/site-packages" "$temp_dir"

echo "Desativando o ambiente virtual..."
# Desativar o ambiente virtual
deactivate

echo "Criando o arquivo zip..."
# Criar o arquivo resources
resources -r "$output_zip" "$temp_dir"

echo "Removendo o diretório temporário..."
# Remover o diretório temporário
rm -rf "$temp_dir"

echo "Arquivo zip '$output_zip' criado com sucesso!"

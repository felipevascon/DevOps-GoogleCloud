FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de requirements primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Expoe a porta que a aplicação FastAPI irá rodar (padrao 8000)
EXPOSE 8000

# Comando para rodar a aplicação FastAPI usando Uvicorn
# O host 0.0.0.0 permite que a aplicação seja acessível externamente ao conteiner
# Define o comando de execução da aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git wget curl gnupg ca-certificates build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Baixa o código oficial do OpenManus
RUN git clone --depth 1 https://github.com/FoundationAgents/OpenManus.git /app/openmanus

WORKDIR /app/openmanus

RUN pip install --no-cache-dir -r requirements.txt

# Chromium para a ferramenta de navegador do agente
RUN playwright install --with-deps chromium

# Nosso wrapper: expõe o Manus como uma API HTTP simples
COPY server_wrapper.py /app/openmanus/server_wrapper.py

ENV PYTHONUNBUFFERED=1
EXPOSE 7860

RUN useradd -m -u 1000 user && chown -R user:user /app/openmanus
USER user

CMD ["uvicorn", "server_wrapper:app", "--host", "0.0.0.0", "--port", "7860"]

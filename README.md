---
title: OpenManus Engine for Jarvis
emoji: 🤖
colorFrom: blue
colorTo: purple
sdk: docker
app_port: 7860
pinned: false
---

# OpenManus Engine for Jarvis

API HTTP simples que expõe o agente OpenManus (Manus) pro seu Jarvis pessoal chamar
como ferramenta, usando sua própria chave do Gemini como cérebro do agente.

## Configuração (Settings → Variables and secrets deste Space)

- `GEMINI_API_KEY` (secret) — sua chave do Google AI Studio
- `WRAPPER_AUTH_TOKEN` (secret) — invente uma senha qualquer; use o mesmo valor no Jarvis
- `OPENMANUS_MODEL` (variável opcional) — padrão: gemini-3-flash-preview

## Uso

POST /run
Headers: x-auth-token: SEU_TOKEN
Body: {"task": "descreva a tarefa aqui"}

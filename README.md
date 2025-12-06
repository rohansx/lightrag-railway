# LightRAG Railway Template

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/YOUR_TEMPLATE_ID)

One-click deployment of [LightRAG](https://github.com/HKUDS/LightRAG) - a simple and fast Graph-based RAG system.

## Features

- 🚀 One-click deploy to Railway
- 📊 Built-in Web UI for document management
- 🔍 Knowledge Graph visualization
- 🤖 Multiple LLM support (OpenAI, Ollama, Azure, AWS Bedrock)
- 📁 File upload support (PDF, DOC, TXT, etc.)

## Quick Start

1. Click the "Deploy on Railway" button above
2. Set your `LLM_BINDING_API_KEY` (OpenAI key recommended)
3. Deploy and access the Web UI

## Required Environment Variables

| Variable              | Description      | Example       |
| --------------------- | ---------------- | ------------- |
| `LLM_BINDING_API_KEY` | Your LLM API key | `sk-...`      |
| `LLM_MODEL`           | Model to use     | `gpt-4o-mini` |

## Optional Configuration

| Variable          | Default                  | Description          |
| ----------------- | ------------------------ | -------------------- |
| `LLM_BINDING`     | `openai`                 | LLM provider         |
| `EMBEDDING_MODEL` | `text-embedding-3-small` | Embedding model      |
| `EMBEDDING_DIM`   | `1536`                   | Embedding dimensions |

## API Endpoints

- `GET /health` - Health check
- `POST /documents` - Upload documents
- `POST /query` - Query the RAG system
- `GET /graph` - Get knowledge graph

## Links

- [LightRAG GitHub](https://github.com/HKUDS/LightRAG)
- [LightRAG Paper (EMNLP 2025)](https://arxiv.org/abs/2410.05779)

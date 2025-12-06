FROM python:3.12-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install LightRAG with API support
RUN pip install --no-cache-dir "lightrag-hku[api]"

# Create data directories
RUN mkdir -p /app/data/rag_storage /app/data/inputs

# Set environment defaults
ENV PORT=9621
ENV WORKING_DIR=/app/data/rag_storage
ENV INPUT_DIR=/app/data/inputs

# Expose port
EXPOSE $PORT

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:$PORT/health || exit 1

# Start command (shell form to expand environment variables)
CMD sh -c "lightrag-server --host 0.0.0.0 --port ${PORT:-9621} --working-dir ${WORKING_DIR:-/app/data/rag_storage} --input-dir ${INPUT_DIR:-/app/data/inputs}"
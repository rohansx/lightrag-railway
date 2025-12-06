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

# Copy startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Set environment defaults
ENV PORT=9621
ENV WORKING_DIR=/app/data/rag_storage
ENV INPUT_DIR=/app/data/inputs

# Expose port
EXPOSE 9621

# Health check (Railway will override PORT at runtime)
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:${PORT:-9621}/health || exit 1

# Start command
CMD ["/app/start.sh"]
#!/bin/sh
set -e

# Use Railway's PORT or default to 9621
: "${PORT:=9621}"
: "${WORKING_DIR:=/app/data/rag_storage}"
: "${INPUT_DIR:=/app/data/inputs}"

echo "Starting LightRAG server on port $PORT"
exec lightrag-server --host 0.0.0.0 --port "$PORT" --working-dir "$WORKING_DIR" --input-dir "$INPUT_DIR"

  paperless-gpt:
    image: icereed/paperless-gpt:latest
    container_name: paperless-gpt
    restart: unless-stopped
    ports:
      - 3002:8080
    environment:
      PAPERLESS_BASE_URL: http://${PAPERLESS_NGX_IP}:${PAPERLESS_PORT}
      PAPERLESS_API_TOKEN: ${PAPERLESS_TOKEN}
      LLM_PROVIDER: ollama
      OLLAMA_HOST: http://${OPENWEBUI}:${OLLAMA_PORT}
      LLM_MODEL: ${OLLAMA_MODEL_TAG}
      AUTO_TAG_NAME: paperless-gpt
      LOG_LEVEL: info
      AUTO_OCR_TAG: paperless-gpt-ocr-auto
      AUTO_TAG: paperless-gpt-auto
      MANUAL_TAG: paperless-gpt-manual
      PDF_OCR_TAGGING: true
      PDF_OCR_COMPLETE_TAG: paperless-gpt-ocr-complete
      PDF_UPLOAD: false
      OLLAMA_CONTEXT_LENGTH: 8192 # Sets Ollama NumCtx (context window)
      TOKEN_LIMIT: 1000 # Recommended for smaller models
      LLM_LANGUAGE: English # Optional, default: English
      OCR_PROVIDER: llm
      VISION_LLM_PROVIDER: ollama
      VISION_LLM_MODEL: ${OLLAMA_MODEL_OCR}
    volumes:
      - ./paperless-gpt/prompts:/app/prompts
networks: {}

# Comprobar si Ollama ya está corriendo
if pgrep -x "ollama" > /dev/null
then
    echo "Ollama ya está corriendo"
else
    ./bin/ollama serve &
    pid=$!
    sleep 5
fi

# Descargar el modelo mistral si no está disponible
echo "Descargando modelo mistral..."
ollama pull mistral

# Descargar los modelos adicionales
echo "Descargando modelos adicionales..."
ollama pull mxbai-embed-large
ollama pull nomic-embed-text

# Esperar a que Ollama termine de iniciar
wait $pid
echo "Ollama finalizado"

# Running ollama

# Run this in a separate session. Ollama will use port 11434 by default.
# You can run ollama serve --help for more configurations.
ollama serve

# In another terminal, to automatically download and chat to amodel, run this:
ollama run "<|model_name|>"
# for example, `ollama run qwen3:0.6b`

# to unload a model from gpu:
ollama stop "<|model_name|>"

# to delete a model from cache
ollama rm "<|model_name|>"

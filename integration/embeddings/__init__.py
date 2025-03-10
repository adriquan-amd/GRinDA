from llama_index.embeddings.ollama import OllamaEmbedding
from llama_index.core.settings import Settings
from config import config


Settings.embed_model = OllamaEmbedding(model_name=config.embedding_model)
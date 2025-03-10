from config import config 

from llama_index.llms.ollama import Ollama 
from llama_index.core.settings import Settings



# 获取配置项

llm_class = config.class_name

# 根据配置创建 Ollama 对象
if llm_class == "Ollama":
    Settings.llm = llm = Ollama(
        base_url=config.base_url,
        api_key=config.api_key,
        model=config.model,
        temperature=config.temperature
    )


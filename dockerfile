# 使用官方 Neo4j 最新版本作为基础镜像
FROM neo4j:latest

# 设置环境变量，启用 APOC 插件
ENV NEO4J_apoc_export_file_enabled=true \
    NEO4J_apoc_import_file_enabled=true \
    NEO4J_apoc_import_file_use__neo4j__config=true \
    NEO4JLABS_PLUGINS='["apoc"]'

# 暴露 Neo4j 端口
EXPOSE 7474 7687

# 运行 Neo4j
CMD ["neo4j"]

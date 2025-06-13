# Grimoire Deploy

Este repositório contém os arquivos necessários para o deploy da aplicação Grimoire usando Docker, Docker Compose e Nginx.

## Estrutura

- `grimoire-backend/` - Dockerfile e build do backend (Spring Boot)
- `grimoire-frontend/` - Dockerfile e build do frontend (React/TypeScript)
- `image-manager/` - Dockerfile e build do image-manager
- `nginx/` - Configuração do proxy reverso
- `docker-compose.yml` - Orquestração dos containers

## Deploy

```bash
docker-compose up --build -d
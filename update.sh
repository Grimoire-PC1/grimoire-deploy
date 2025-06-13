#!/bin/bash

# Função para descobrir os serviços disponíveis no docker-compose.yml
obter_servicos() {
  docker-compose config --services 2>/dev/null
}

# Exibe menu dinamicamente
exibir_menu() {
  echo "Selecione o serviço que deseja atualizar:"
  local i=1
  for servico in "${SERVICOS[@]}"; do
    echo "$i) $servico"
    ((i++))
  done
  echo "$i) Sair"
}

# Obtém os serviços
mapfile -t SERVICOS < <(obter_servicos)
if [ ${#SERVICOS[@]} -eq 0 ]; then
  echo "Nenhum serviço encontrado no docker-compose.yml."
  exit 1
fi

# Loop de seleção
while true; do
  exibir_menu
  read -p "Digite o número da sua escolha: " escolha

  if [[ "$escolha" =~ ^[0-9]+$ ]] && (( escolha >= 1 && escolha <= ${#SERVICOS[@]} )); then
    SERVICO="${SERVICOS[$((escolha - 1))]}"
    break
  elif (( escolha == ${#SERVICOS[@]} + 1 )); then
    echo "Saindo do script."
    exit 0
  else
    echo "Opção inválida! Por favor, selecione uma das opções listadas."
  fi
done

echo "Liberando espaço..."
sudo docker system prune -f

echo "Construindo o serviço $SERVICO sem cache..."
sudo docker-compose build --no-cache "$SERVICO"

echo "Parando o serviço $SERVICO..."
sudo docker-compose stop "$SERVICO"

echo "Removendo o serviço $SERVICO..."
sudo docker-compose rm -f "$SERVICO"

echo "Iniciando o serviço $SERVICO..."
sudo docker-compose up -d "$SERVICO"

echo "Esperando construção da aplicação..."
sleep 10

echo "Processo completo para o serviço $SERVICO."
sudo docker-compose ps -a

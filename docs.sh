#!/bin/bash

# Diretórios dos módulos e ambientes
MODULES=("modules/azure/network" "modules/azure/storage" "modules/azure/vms")
ENVS=("dev")

# Gera documentação para os módulos
for module in "${MODULES[@]}"; do
  echo "Gerando documentação para $module..."
  terraform-docs markdown table "$module" > "$module/README.md"
done

# Gera documentação para os ambientes e adiciona seção de módulos manualmente
for env in "${ENVS[@]}"; do
  echo "Gerando documentação para $env..."
  terraform-docs markdown table "$env" > "$env/README.md"
done

echo "Documentação gerada com sucesso!"
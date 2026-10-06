#!/usr/bin/env bash
# Instala ou atualiza o AIOX (ultima versao oficial do SynkraAI/aiox-core)
# em um ou varios projetos. Preserva CLAUDE.md e .env existentes (--merge).
#
# Uso:
#   ./aiox-everywhere.sh                    # projeto atual
#   ./aiox-everywhere.sh ~/Desktop/*/       # varios projetos de uma vez
#
# Dica: crie um alias para usar em qualquer pasta:
#   echo "alias aiox-here='$(pwd)/aiox-everywhere.sh'" >> ~/.zshrc

set -euo pipefail

alvos=("$@")
[ ${#alvos[@]} -eq 0 ] && alvos=("$PWD")

for dir in "${alvos[@]}"; do
  [ -d "$dir" ] || { echo "Pulando (nao e pasta): $dir"; continue; }
  echo "==> AIOX em $dir"
  (
    cd "$dir"
    npx -y -p @aiox-squads/core@latest aiox install --ci --yes --merge --ide claude-code
    echo "Versao instalada: $(grep -m1 '"version"' .aiox-core/version.json)"
  )
done

echo
echo "AIOX Pro (precisa de login proprio, rode voce mesmo em cada projeto):"
echo "  npx -y -p @aiox-squads/core@latest aiox pro setup"

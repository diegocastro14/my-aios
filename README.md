# my-aios

Setup pessoal para ter o AIOX (SynkraAI/aiox-core) em todos os projetos.

O AIOX nao tem instalacao global para o Claude Code: cada projeto recebe seu
proprio `.aiox-core`. O script `aiox-everywhere.sh` instala ou atualiza a ultima
versao em qualquer pasta, preservando `CLAUDE.md` e `.env`.

## Configuracao unica (Mac)

```bash
git clone https://github.com/diegocastro14/my-aios ~/my-aios
chmod +x ~/my-aios/aiox-everywhere.sh
echo "alias aiox-here='$HOME/my-aios/aiox-everywhere.sh'" >> ~/.zshrc
source ~/.zshrc
```

## Uso

```bash
cd ~/Desktop/novo-projeto && aiox-here   # projeto novo ou existente
aiox-here ~/Desktop/*/                   # varios projetos de uma vez
```

Rode de novo quando quiser atualizar: o script sempre usa `@latest`.

## AIOX Pro

Exige login proprio (email e senha ou chave `PRO-...`). Em cada projeto:

```bash
npx -y -p @aiox-squads/core@latest aiox pro setup
npx -y -p @aiox-squads/core@latest aiox pro status
```

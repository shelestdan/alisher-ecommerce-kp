#!/usr/bin/env bash
set -euo pipefail

OWNER="shelestdan"
REPO_NAME="alisher-ecommerce-kp"
REPO_FULL="$OWNER/$REPO_NAME"
PAGE_URL="https://$OWNER.github.io/$REPO_NAME/"

if ! command -v gh >/dev/null 2>&1; then
  echo "Ошибка: GitHub CLI не установлен. Установите gh: https://cli.github.com/"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Нужно авторизоваться в GitHub CLI. Запустите: gh auth login"
  exit 1
fi

if [ ! -d .git ]; then
  git init
fi

git checkout -B main

git add .
if git diff --cached --quiet; then
  echo "Нет новых изменений для коммита."
else
  git commit -m "Init commercial proposal landing"
fi

if gh repo view "$REPO_FULL" >/dev/null 2>&1; then
  echo "Репозиторий $REPO_FULL уже существует."
  if ! git remote get-url origin >/dev/null 2>&1; then
    git remote add origin "https://github.com/$REPO_FULL.git"
  fi
else
  gh repo create "$REPO_FULL" --public --source=. --remote=origin
fi

git push -u origin main

# Включаем GitHub Pages из ветки main и корня репозитория.
# Если Pages уже включены, обновляем настройки.
if gh api --method GET "repos/$REPO_FULL/pages" >/dev/null 2>&1; then
  gh api --method PUT "repos/$REPO_FULL/pages" \
    -H "Accept: application/vnd.github+json" \
    -f source[branch]=main \
    -f source[path]=/ >/dev/null
else
  gh api --method POST "repos/$REPO_FULL/pages" \
    -H "Accept: application/vnd.github+json" \
    -f source[branch]=main \
    -f source[path]=/ >/dev/null
fi

echo "Готово. GitHub Pages: $PAGE_URL"

# КП для интернет-магазина Алишера

Готовая статическая страница коммерческого предложения для публикации на GitHub Pages.

## Что внутри

- `index.html` — готовая HTML/CSS-страница КП.
- `.nojekyll` — отключает обработку Jekyll на GitHub Pages.
- `.gitignore` — базовые исключения для репозитория.
- `deploy-github-pages.sh` — скрипт для создания публичного репозитория и включения GitHub Pages через GitHub CLI.

## Рекомендуемый репозиторий

```text
shelestdan/alisher-ecommerce-kp
```

После публикации страница будет доступна по адресу:

```text
https://shelestdan.github.io/alisher-ecommerce-kp/
```

## Публикация через GitHub CLI

Установите GitHub CLI и авторизуйтесь:

```bash
gh auth login
```

Затем из папки проекта выполните:

```bash
chmod +x deploy-github-pages.sh
./deploy-github-pages.sh
```

Скрипт:

1. Инициализирует Git-репозиторий.
2. Создает ветку `main`.
3. Делает первый коммит.
4. Создает публичный репозиторий `shelestdan/alisher-ecommerce-kp`.
5. Загружает файлы на GitHub.
6. Включает GitHub Pages из ветки `main`, папка `/`.

## Ручная публикация

```bash
git init
git checkout -b main
git add .
git commit -m "Init commercial proposal landing"
git remote add origin https://github.com/shelestdan/alisher-ecommerce-kp.git
git push -u origin main
```

После этого в GitHub:

1. Откройте репозиторий.
2. Перейдите в `Settings` → `Pages`.
3. В `Build and deployment` выберите `Deploy from a branch`.
4. Branch: `main`, folder: `/root` или `/`.
5. Сохраните настройки.

## Сообщение клиенту

Алишер, добрый день. Я подготовил отдельную страницу с предварительным КП по вашему интернет-магазину: подход к архитектуре, самописной CMS, стеку Node.js + React, безопасности, этапам и бюджету.  
Ссылка: https://shelestdan.github.io/alisher-ecommerce-kp/

Оценка пока предварительная — после полного ТЗ смогу разложить проект по срокам, стоимости, функциональным блокам и точной архитектуре.

#!/bin/bash

# Визначте назву репозиторію та ваше ім'я користувача на GitHub
REPO="weather-app"
USERNAME="AndriykoH"

# Створіть нову гілку для розгортання
git checkout -b gth-pages

# Виконайте збірку проекту Vue.js
npm run build

# Перемістіть зібраний вміст в папку dist
mv dist/* .

# Додайте зміни та створіть коміт
git add .
git commit -m "Deploy to GitHub Pages"

# Залогіньтеся в GitHub з використанням ваших облікових даних
git remote set-url origin https://github.com/$USERNAME/$REPO.git

# Залогіньтеся до вашого акаунту GitHub, щоб виконати пуш в GitHub Pages
git push --force origin gth-pages

# Поверніться до головної гілки
git checkout -

# Видаліть гілку gh-pages (необов'язково)
git branch -D gth-pages

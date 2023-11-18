# Используем официальный образ Nginx с определенной версией
FROM nginx:1.25.3

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /usr/share/nginx/html

# Копируем содержимое локальной папки nginx/html внутрь контейнера
COPY nginx/html/ .

# Определяем имя контейнера
LABEL name="netology-05-virt-03-docker-01-nginx"

# Открываем порт
EXPOSE 80

# Запускаем Nginx в фоновом режиме при старте контейнера
CMD ["nginx", "-g", "daemon off;"]

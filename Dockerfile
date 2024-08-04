# Используем базовый образ Node.js
FROM node:16-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем весь проект в рабочую директорию
COPY . .

# Собираем проект
RUN npm run build

# Указываем порт, который будет использоваться контейнером
EXPOSE 8080

# Запускаем команду для сервера разработки
CMD ["npm", "run", "serve"]
FROM python:3.12-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы зависимостей и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальной код приложения
COPY . .

# Указываем порт, который будет слушать приложение
EXPOSE 8181

# Команда запуск
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8181"]

# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем requirements.txt в контейнер
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы проекта в контейнер
COPY . .

RUN python -m manage migrate

# Открываем порт 8000
EXPOSE 8000

# Запускаем сервер
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
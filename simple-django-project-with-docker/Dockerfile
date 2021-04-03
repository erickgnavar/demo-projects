FROM python:3.8.6-slim-buster

# Create app directory
WORKDIR /app

# Install system libraries
RUN apt update && apt install python-dev postgresql-client libxslt-dev libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev gettext -y

# Install dependencies
ADD requirements.txt .
RUN pip install -r requirements.txt

# Bundle app source
COPY . /app

EXPOSE 8000

CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]

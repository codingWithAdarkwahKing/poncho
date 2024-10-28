#!/bin/bash

# Apply migrations
python manage.py makemigrations
python manage.py migrate --noinput

python manage.py createsuperuser --noinput || true

# Start the Django development server
python manage.py runserver 0.0.0.0:8000

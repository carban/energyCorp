FROM python:3.6-alpine
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app

COPY ./Backend/requirements.txt .
COPY ./Backend/src .

RUN pip install -r requirements.txt

RUN adduser -D myuser
USER myuser

#EXPOSE 8000

ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]

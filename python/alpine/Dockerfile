ARG VERSION=3.7
FROM python:3.7-alpine

WORKDIR /app

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY app.py ./

ENTRYPOINT ["python", "app.py"]

ARG $VERSION

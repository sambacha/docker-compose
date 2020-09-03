# Start with python base image
FROM python:3.8-slim

# Install necessary libraries
RUN apt-get update

RUN apt-get -y install apt-utils libc-dev build-essential software-properties-common

# Copy the requirements.txt file to setup directory
COPY . /setup

WORKDIR /setup

RUN pip install -r requirements.txt

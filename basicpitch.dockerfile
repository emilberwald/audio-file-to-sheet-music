FROM python:3.11-slim
ENV DEBIAN_FRONTEND=noninteractive

RUN python3.11 -m pip install --upgrade pip
RUN python3.11 -m pip install basic-pitch

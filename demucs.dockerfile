FROM python:3.11-slim
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y ffmpeg
RUN python3.11 -m pip install --upgrade pip
RUN python3.11 -m pip install torchcodec
RUN python3.11 -m pip install demucs

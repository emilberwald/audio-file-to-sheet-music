FROM python:3.11-slim
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y wget tar
RUN wget -O /tmp/lilypond-2.24.4-linux-x86_64.tar.gz https://gitlab.com/lilypond/lilypond/-/releases/v2.24.4/downloads/lilypond-2.24.4-linux-x86_64.tar.gz
RUN tar -xzf /tmp/lilypond-2.24.4-linux-x86_64.tar.gz -C /tmp
RUN mv /tmp/lilypond-2.24.4 /opt/lilypond
RUN rm /tmp/lilypond-2.24.4-linux-x86_64.tar.gz
ENV PATH="/opt/lilypond/bin:${PATH}"

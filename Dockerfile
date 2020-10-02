FROM python:3

ARG RELEASE=3.1.3

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends python3-pip nodejs default-jre-headless rsync && \
    npm install -g less@2.7.2 && \
    pip3 install lektor==$RELEASE && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /lektor

WORKDIR /lektor

CMD ["lektor"]

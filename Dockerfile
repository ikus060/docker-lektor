FROM python:3-slim

ARG RELEASE=3.1.3

ENV DEBIAN_FRONTEND=noninteractive

# Install Lessc using npm, then remove npm to release spaces.
RUN apt-get update && \
    apt-get install -y --no-install-recommends npm nodejs && \
    npm install -g less@2.7.2 && \   
    apt-get autoremove -y npm && \
    lessc --version && \
    mkdir /usr/share/man/man1 && \
    apt-get install -y --no-install-recommends default-jre-headless rsync && \
    pip3 install lektor==$RELEASE && \
    rm -rf /var/lib/apt/lists/* /root/.cache /root/.npm /root/.config /var/cache/debconf/* /var/log/* /usr/share/doc/* /usr/share/doc-base/* && \
    mkdir /lektor

WORKDIR /lektor

CMD ["lektor"]

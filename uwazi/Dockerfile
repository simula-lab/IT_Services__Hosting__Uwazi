FROM node:16.20.0
LABEL maintainer="Oussama Jarrousse <jarrousse@simulalab.org>"

RUN echo lsb_release -a

# https://github.com/simula-lab/uwazi/blob/development/SELF_HOSTED_INSTRUCTIONS.md
RUN apt-get update && \
    apt-get install -y gnupg
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-6.gpg
RUN echo "deb [ signed=/usr/share/keyrings/mongodb-server-6.0.gpg ] http://repo.mongodb.org/apt/debian buster/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list
RUN apt-get update && \
    apt-get install -y mongodb-org vim

RUN useradd -ms /bin/bash uwazi
WORKDIR /root

RUN wget https://github.com/huridocs/uwazi/releases/latest/download/uwazi.tgz
RUN tar xvf uwazi.tgz
RUN mv prod latest 
RUN rm uwazi.tgz

ENV NODE_ENV=production
ENV FILES_ROOT_PATH=/root/latest
WORKDIR /root/latest

COPY docker-entrypoint.sh ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

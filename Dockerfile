FROM node:slim

WORKDIR /app

COPY . .
 
EXPOSE 7860

RUN apt-get update && \
    chmod 775 server index.js package.json start.sh /app &&\
    apt-get install -y iproute2  coreutils  procps curl && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm install -r package.json

CMD ["node", "index.js"]

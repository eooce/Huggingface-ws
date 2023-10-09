FROM node:slim

WORKDIR /app

COPY . .
 
EXPOSE 7860

RUN apt-get update && \
    chmod 775 server index.js package.json start.sh /app &&\
    npm install -r package.json

CMD ["node", "index.js"]

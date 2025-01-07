      FROM node:23-alpine3.19

LABEL info="Aplicação KubeDev" \ 
      obs="Dockerfile Adaptado" \ 
      autor="Thiago Ranieri Siquela"

WORKDIR /app/ 
EXPOSE 8080

RUN adduser node-runner -u 1001 -G node -s /bin/sh -D node

COPY --chown=node-runner:node --chmod=750 ./kube-news/src/ /app/
COPY --chown=node-runner:node --chmod=750 ./kube-news/popula-dados.http /app/temp/

RUN npm install 


# Definir variáveis no compose. 
ENV DB_DATABASE=""
ENV DB_USERNAME=""
ENV DB_PASSWORD=""
ENV DB_HOST=""

USER node-runner

ENTRYPOINT [ "node", "server.js" ]
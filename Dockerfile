FROM nginx:1.17.2-alpine

LABEL maintainer="Jeremi FERRE <ferrejeremi@gmail.com>"

RUN apk update && apk add nodejs-current

CMD [ "node" ]
FROM php:alpine


ENV PLEX_URL="http://localhost:32400"
ENV PLEX_SECTIONS=all
ENV PLEX_SORT_SKIP_WORDS=""
ENV PLEX_TOKEN=
ENV PLEX_INTERVAL=60m


#Updates everything
RUN apk update && apk add --no-cache git

#Clones git repo (content) into /var/www/html
WORKDIR /app
RUN git clone https://github.com/Dachande663/Plex-Export.git .


#Copies entrypoint-script for modifying .env-file
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

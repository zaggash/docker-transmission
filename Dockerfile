FROM linuxserver/transmission
MAINTAINER zaggash

# install packages and NzbToMedia Requirements
RUN \
 apk add --no-cache \
 	git \
	python && \

 git -C /app clone -q  https://github.com/clinton-hall/nzbToMedia.git && \

 rm -rf /var/cache/apk/* /tmp/*

# copy local files
COPY root/ /

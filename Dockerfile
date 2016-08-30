FROM linuxserver/transmission
MAINTAINER zaggash

# install packages
RUN \
 apk add --no-cache \
	python

# Setup NzbToMedia
RUN \
 git -C /app clone -q  https://github.com/clinton-hall/nzbToMedia.git

# copy local files
COPY root/ /

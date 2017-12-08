Based on linuxserver.io baseimage but NOT SUPPORTED by them.

I added NzbToMedia in order to use the PostProcess effect from this script.

# zaggash/docker-transmission
[![](https://images.microbadger.com/badges/version/zaggash/docker-transmission.svg)](https://microbadger.com/images/zaggash/docker-transmission "Get your own version badge on microbadger.com")
[hub]: https://hub.docker.com/r/zaggash/docker-transmission/

Transmission is designed for easy, powerful use. Transmission has the features you want from a BitTorrent client: encryption, a web interface, peer exchange, magnet links, DHT, µTP, UPnP and NAT-PMP port forwarding, webseed support, watch directories, tracker editing, global and per-torrent speed limits, and more. [Transmission](http://www.transmissionbt.com/about/)

![](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/transmission.png)

## Usage

```
docker create --name=transmission \
-v <path to data>:/config \
-v <path to downloads>:/downloads \
-v <path to watch folder>:/watch \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 9091:9091 -p 51413:51413 \
-p 51413:51413/udp \
linuxserver/transmission
```

**Parameters**

* `-p 9091` 
* `-p 51413` - the port(s)
* `-v /config` - where transmission should store config files and logs
* `-v /downloads` - local path for downloads
* `-v /watch` - watch folder for torrent files
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it transmission /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 

Webui is on port 9091, the settings.json file in /config has extra settings not available in the webui. Stop the container before editing it or any changes won't be saved.


## Info

* To monitor the logs of the container in realtime `docker logs -f transmission`.



## Versions

+ **28.08.16:** Add badges to README.
+ **09.08.16:** Rebase to alpine linux.
+ **06.12.15:** Separate mapping for watch folder.
+ **16.11.15:** Initial Release. 


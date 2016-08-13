FROM alpine:3.4
MAINTAINER Jim Leirvik

RUN adduser -D rtorrent

COPY ./.rtorrent.rc /home/rtorrent/

RUN apk add --update rtorrent && \
    mkdir /home/rtorrent/.session /data /data/complete /data/incomplete /data/watch && \
    chown -R rtorrent:rtorrent /home/rtorrent/ /data

VOLUME ["/data/complete", "/data/incomplete", "/data/watch"]
EXPOSE 51413

USER rtorrent
CMD  ["rtorrent"]
FROM alpine:3.22

COPY config.sh /tmp/

RUN sh /tmp/config.sh

COPY run.sh /

RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]

CMD ["php-fpm83", "-F", "--nodaemonize"]

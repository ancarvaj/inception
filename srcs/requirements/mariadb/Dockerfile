FROM alpine:3.22

COPY conf/config.sh /tmp/

RUN sh /tmp/config.sh

COPY tools/run.sh /.

RUN chmod +x run.sh

ENTRYPOINT ["/run.sh"]

CMD ["/usr/bin/mariadbd", "--datadir=/var/lib/mysql", "--user=mysql", "--bind-address=0.0.0.0", "--port=3306", "--skip-networking=0"]

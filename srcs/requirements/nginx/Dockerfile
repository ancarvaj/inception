FROM alpine:3.22

COPY conf/config.sh /tmp

RUN sh /tmp/config.sh

RUN mkdir -p /etc/nginx/certs

COPY conf/wordpress.conf /etc/nginx/http.d/.

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

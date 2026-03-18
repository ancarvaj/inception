FROM alpine:3.22

COPY config.sh /tmp

RUN sh /tmp/config.sh

COPY wordpress.conf /etc/nginx/http.d/.

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]

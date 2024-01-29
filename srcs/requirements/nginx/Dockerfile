FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*\
	&& chown -R www-data:www-data /var/www/html/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/CN=umartin-.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/index.html /var/www/html/index.html


CMD ["nginx", "-g", "daemon off;"]

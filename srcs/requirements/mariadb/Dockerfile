FROM debian:bullseye

# WORKDIR /

RUN apt update; apt -y upgrade; apt install -y mariadb-server;

# EXPOSE 3306

# COPY conf/init.sh .

# RUN chmod +x init.sh

# CMD ["./init.sh"]

CMD ["tail", "-f", "/dev/null"]

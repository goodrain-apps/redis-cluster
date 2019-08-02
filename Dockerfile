FROM redis:4.0.14-alpine
ENV TZ Asia/Shanghai
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache bash telnet && \
    wget https://github.com/barnettZQG/env2file/releases/download/0.1.1/env2file-linux -O /usr/bin/env2file && \
    chmod +x /usr/bin/env2file


EXPOSE  6379
VOLUME /data

ADD docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
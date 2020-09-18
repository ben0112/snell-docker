FROM primovist/alpine-glibc
LABEL maintainer="primovist" \
        org.label-schema.name="snell-server"
ENV LANG=C.UTF-8
ENV PORT=10900
ENV PSK=
ENV OBFS=tls
COPY Entrypoint.sh /usr/bin/
COPY get_snell.sh /tmp/
RUN sh /tmp/get_snell.sh && \
    rm -f /tmp/get_snell.sh && \
    chmod +x /usr/bin/Entrypoint.sh
ENTRYPOINT ["Entrypoint.sh"]

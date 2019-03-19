#!/bin/sh
BIN="/usr/bin/snell-server"
CONF="/etc/snell-server.conf"
# reuse existing config when the container restarts
run() {
    ${BIN} -c ${CONF}
}
if [ -f ${CONF} ]; then
    echo "Found existing config..."
    run
 else
    if [ -z ${PSK} ]; then
        PSK=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16)
        echo "Using generated PSK: ${PSK}"
    else
        echo "Using predefined PSK: ${PSK}"
    fi
    echo "Generating new config..."
    echo "[snell-server]" >> ${CONF}
    echo "listen = 0.0.0.0:${SERVER_PORT}" >> ${CONF}
    echo "psk = ${PSK}" >> ${CONF}
    echo "obfs = tls" >> ${CONF}
    run
fi
#!/bin/sh
url=$(wget -qO- https://api.github.com/repos/surge-networks/snell/releases/latest | grep -e "browser_download_url" | grep linux-amd64 | grep -o 'https*://[^"]*')
wget --no-check-certificate -qO snell.zip $url
unzip snell.zip
rm snell.zip
chmod +x snell-server
mv snell-server /usr/bin/

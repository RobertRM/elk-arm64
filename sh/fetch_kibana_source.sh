#!/usr/bin/env sh
source $(pwd)/.env
mkdir -p elk_src
cd elk_src
wget https://artifacts.elastic.co/downloads/kibana/kibana-$ELK_VERSION-linux-$ELK_ARCH.tar.gz -O kibana-$ELK_VERSION-linux-$ELK_ARCH.tar.gz
wget https://artifacts.elastic.co/downloads/kibana/kibana-$ELK_VERSION-linux-$ELK_ARCH.tar.gz.sha512 -O kibana-$ELK_VERSION-linux-$ELK_ARCH.tar.gz.sha512
echo "Checking checksum"
OK=$(shasum -a 512 -c kibana-$ELK_VERSION-linux-$ELK_ARCH.tar.gz.sha512 | cut -d ":" -f 2 | xargs)
if [ "$OK" != "OK" ]; then
	echo "Checksums don't match, aborting..."
	exit
fi
echo "Expanding Archive..."
tar -xvf kibana-*.tar.gz > /dev/null 2>&1
rm -f kibana-*.tar.gz
rm -f kibana-*.tar.gz.sha512
cd ..

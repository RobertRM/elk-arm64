#!/usr/bin/env sh
source $(pwd)/.env
mkdir -p elk_src
cd elk_src
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELK_VERSION-linux-$ELK_ARCH.tar.gz -O elasticsearch-$ELK_VERSION-linux-$ELK_ARCH.tar.gz
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELK_VERSION-linux-$ELK_ARCH.tar.gz.sha512 -O elasticsearch-$ELK_VERSION-linux-$ELK_ARCH.tar.gz.sha512
echo "Checking checksum"
OK=$(shasum -a 512 -c elasticsearch-$ELK_VERSION-linux-$ELK_ARCH.tar.gz.sha512 | cut -d ":" -f 2 | xargs)
if [ "$OK" != "OK" ]; then
	echo "Checksums don't match, aborting..."
	exit
fi
echo "Expanding Archive..."
tar -xvf elasticsearch-*.tar.gz > /dev/null 2>&1
rm -f elasticsearch-*.tar.gz
rm -f elasticsearch-*.tar.gz.sha512
cd ..

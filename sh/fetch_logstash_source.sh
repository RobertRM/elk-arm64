#!/usr/bin/env sh
source $(pwd)/.env
mkdir -p elk_src
cd elk_src
wget https://artifacts.elastic.co/downloads/logstash/logstash-$ELK_VERSION-linux-$ELK_ARCH.tar.gz -O https://artifacts.elastic.co/downloads/logstash/logstash-7.10.1-linux-aarch64.tar.gz
wget https://artifacts.elastic.co/downloads/logstash/logstash-$ELK_VERSION-linux-$ELK_ARCH.tar.gz.sha512 -O logstash-$ELK_VERSION-linux-$ELK_ARCH.tar.gz.sha512
echo "Checking checksum"
OK=$(shasum -a 512 -c logstash-$ELK_VERSION-linux-$ELK_ARCH.tar.gz.sha512 | cut -d ":" -f 2 | xargs)
if [ "$OK" != "OK" ]; then
	echo "Checksums don't match, aborting..."
	exit
fi
echo "Expanding Archive..."
tar -xvf logstash-*.tar.gz > /dev/null 2>&1
rm -f logstash-*.tar.gz
rm -f logstash-*.tar.gz.sha512
cd ..

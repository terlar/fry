FROM debian:jessie
MAINTAINER Terje Larsen

WORKDIR /usr/src

RUN echo "deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_7.0/ /" >> /etc/apt/sources.list \
	&& apt-get update && apt-get install -y --force-yes --no-install-recommends \
		libncurses-dev \
		bc \
		fish \
		ca-certificates \
		curl \
		make \
	&& curl -Lso fish-tank-master.tar.gz https://github.com/terlar/fish-tank/archive/master.tar.gz \
	&& tar -zxf fish-tank-master.tar.gz \
	&& cd fish-tank-master && make install \
	&& rm -rf /var/lib/apt/lists/*

COPY . /usr/src/fry/
WORKDIR /usr/src/fry
RUN make install

RUN mkdir -p /root/.config/fish \
	&& touch /root/.config/fish/config.fish \
	&& echo 'source /usr/local/share/fry/fry.fish' >> /root/.config/fish/config.fish

CMD [ "fish" ]

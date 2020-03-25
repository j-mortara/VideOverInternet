FROM ubuntu:18.04
RUN apt-get update \
	&& apt-get install build-essential libpcre3 libpcre3-dev libssl-dev git zlib1g-dev wget -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir /build \
	&& cd /build \
	&& git clone git://github.com/arut/nginx-rtmp-module.git \
	&& wget http://nginx.org/download/nginx-1.14.1.tar.gz \
	&& tar xzf nginx-1.14.1.tar.gz \
	&& cd /build/nginx-1.14.1 \
	&& ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module \
	&& make \
	&& make install \
	&& apt-get purge --auto-remove build-essential git wget -y
COPY nginx.conf /usr/local/nginx/conf/nginx.conf
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
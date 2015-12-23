FROM linuxserver/baseimage.nginx

ENV APTLIST="git-core nodejs php5 php5-mysqlnd  php5-curl php5-mcrypt php5-imagick php5-cgi php5-memcached memcached redis-server"

RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php5-5.6 && \
add-apt-repository ppa:chris-lea/redis-server && \
curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
apt-get install $APTLIST -qy && \
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
npm install -g npm@latest && \
npm install -g grunt-cli bower gulp pm2 && \

# clean up
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ports and volumes
VOLUME /config
EXPOSE 80 443

#!/bin/bash

DOMAIN=""
IP=192.168.0.100
read -p "Domínio: " DOMAIN

echo "zone \"$DOMAIN\" IN {
        type master;
        file \"/var/named/$DOMAIN.hosts\";
};" >> /etc/named.conf

FORWARD_FILE=/var/named/$DOMAIN.hosts
touch $FORWARD_FILE

echo "\$ttl 38400
@       IN      SOA     $HOSTNAME. mail.$DOMAIN.(
                        1165190726 ;serial
                        10800 ;refresh
                        3600 ; retry
                        604800 ; expire
                        38400 ; minimum
                        )
        IN      NS      $HOSTNAME.
@       IN      A       $IP
www     IN      A       $IP" > $FORWARD_FILE



PAGE_FILE=/hosting/$DOMAIN
mkdir -p $PAGE_FILE

chmod 755 $PAGE_FILE -R
HTML_FILE=/hosting/$DOMAIN/index.html
touch $HTML_FILE
echo "<h1>Welcome to $DOMAIN<h1>" >> $HTML_FILE

APACHE_CONF_FILE=/etc/httpd/conf/httpd.conf

echo "
<VirtualHost *:80>
        DocumentRoot \"$PAGE_FILE\"
        ServerName www.$DOMAIN
        ServerAlias $DOMAIN
        <Directory \"$PAGE_FILE\">
                Options Indexes FollowSymLinks
                AllowOverride All
                Order allow,deny
                Allow from all
        </Directory>
</VirtualHost>" >> $APACHE_CONF_FILE

systemctl restart named
systemctl restart httpd
#!/bin/bash/

echo "==========================================Actualizando"

apt-get -y update
apt-get install -y apache2 mysql-server git php5 libapache2-mod-php5 make php5-gd php5-curl php5-dev php5-mysql php5-common php-pear

echo "==========================================Paquetes Instalados"

echo "==========================================Creando la base de datos"

mysqladmin -uroot -p create drupal7

echo "==========================================Creando directorio /srv/www "

cd /srv ; mkdir www 
cd /srv ; chmod 777 www

echo "==========================================Descargando Drupal"

cd /srv/www ; mkdir $1
cd /srv/www/$1 ; wget http://ftp.drupal.org/files/projects/drupal-7.22.tar.gz
cd /srv/www/$1 ; tar zxvf drupal-7.22.tar.gz
cd /srv/www/$1 ; rm drupal-7.22.tar.gz
cd /srv/www/$1 ; mv drupal-7.22 public_html
cd /srv/www/$1 ; mkdir logs
cd /srv/www/$1 ; chmod 777 logs

echo "==========================================Creando settings.php"

cd /srv/www/$1/public_html/sites/default ; cp default.settings.php settings.php
cd /srv/www/$1/public_html/sites/default ; chmod 777 settings.php
cd /srv/www/$1/public_html/sites/default ; mkdir files
cd /srv/www/$1/public_html/sites/default ; chmod 777 files

echo "==========================================Creando Virtual Host"

cd /etc/apache2/sites-available ; touch $1
echo "<Virtualhost *:80>
 ServerName" $1"
 DocumentRoot /srv/www/"$1"/public_html
 ErrorLog /srv/www/"$1"/logs/error.log
 Customlog /srv/www/"$1"/logs/access.log combined
 <Directory '"'/srv/www/'$1'/public_html'"'>
  AllowOverride All
  Options FollowSymLinks
 </Directory>
</Virtualhost>" > /etc/apache2/sites-available/$1
cd /etc/apache2/sites-available ; a2ensite $1

echo "==========================================instalando modulo apache  para url amigables"

a2enmod rewrite

echo "==========================================instalando uploadprogress"

pecl install uploadprogress

touch /etc/php5/conf.d/uploadprogress.ini
echo "extension=uploadprogress.so" > /etc/php5/conf.d/uploadprogress.ini

service apache2 restart

echo "===========================================Finalizado==============================================="
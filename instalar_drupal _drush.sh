#!/bin/bash/

echo "==========================================Actualizando"
apt-get -y update
apt-get install -y apache2 mysql-server git php5 libapache2-mod-php5 make php5-gd php5-curl php5-dev php5-mysql php5-common php-pear
apt-get install drush

echo "==========================================Paquetes Instalados"

echo "==========================================Creando la base de datos"

mysqladmin -uroot -p create drupal7

echo "==========================================Creando directorio /srv/www "
cd /srv ; mkdir www 
cd /srv ; chmod 777 www

echo "==========================================Descargando Drupal"
cd /srv/www ; mkdir $1
cd /srv/www/$1 ; drush dl
cd /srv/www/$1 ; mv drupal-7.22 public_html
cd /srv/www/$1 ; mkdir logs
cd /srv/www/$1 ; chmod 777 logs

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

echo "==========================================instalando modulo apache para url amigables"
a2enmod rewrite

echo "==========================================instalando uploadprogress"

pecl install uploadprogress

touch /etc/php5/conf.d/uploadprogress.ini
echo "extension=uploadprogress.so" > /etc/php5/conf.d/uploadprogress.ini

service apache2 restart

echo "===========================================Instalador de drupal==============================================="

cd /srv/www/$1/public_html/ ; drush site-install standard --account-name=admin --account-pass=admin --db-url=mysql://root:maurice@localhost/drupal7 --site-name='Mauricio Alberto'

echo "===========================================Instalando modulos==============================================="

cd /srv/www/$1/public_html/ ; drush dl ctools views token pathauto entity entityreference flag

cd /srv/www/$1/public_html/ ; drush en ctools views views_ui token pathauto entity entityreference flag

echo "===========================================Finalizado==============================================="
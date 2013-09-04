#!/bin/bash/

echo "==========================================Instalando modulos"

cd /srv/www/$1/public_html/sites/all/modules ; wget http://ftp.drupal.org/files/projects/views-7.x-3.7.tar.gz
cd /srv/www/$1/public_html/sites/all/modules ; tar zxvf views-7.x-3.7.tar.gz

cd /srv/www/$1/public_html/sites/all/modules ; wget http://ftp.drupal.org/files/projects/token-7.x-1.5.tar.gz
cd /srv/www/$1/public_html/sites/all/modules ; tar zxvf token-7.x-1.5.tar.gz

cd /srv/www/$1/public_html/sites/all/modules ; wget http://ftp.drupal.org/files/projects/ctools-7.x-1.3.tar.gz
cd /srv/www/$1/public_html/sites/all/modules ; tar zxvf ctools-7.x-1.3.tar.gz

cd /srv/www/$1/public_html/sites/all/modules ; wget http://ftp.drupal.org/files/projects/pathauto-7.x-1.2.tar.gz
cd /srv/www/$1/public_html/sites/all/modules ; tar zxvf pathauto-7.x-1.2.tar.gz

cd /srv/www/$1/public_html/sites/all/modules ; wget http://ftp.drupal.org/files/projects/entity-7.x-1.1.tar.gz
cd /srv/www/$1/public_html/sites/all/modules ; tar zxvf entity-7.x-1.1.tar.gz

cd /srv/www/$1/public_html/sites/all/modules ; wget http://ftp.drupal.org/files/projects/entityreference-7.x-1.0.tar.gz
cd /srv/www/$1/public_html/sites/all/modules ; tar zxvf entityreference-7.x-1.0.tar.gz

cd /srv/www/$1/public_html/sites/all/modules ; rm pathauto-7.x-1.2.tar.gz ctools-7.x-1.3.tar.gz token-7.x-1.5.tar.gz views-7.x-3.7.tar.gz entity-7.x-1.1.tar.gz entityreference-7.x-1.0.tar.gz

echo "==========================================Modulos Instalados"

echo "==========================================cambiando permisos a settings.php"

cd /srv/www/$1/public_html/sites/default ; chmod 755 settings.php
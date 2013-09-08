#!/bin/bash/

echo "Instalando modulos"



echo "Modulos Instalados"

echo "Cambiando permisos a settings.php"

cd /srv/www/$1/public_html/sites/default ; chmod 755 settings.php
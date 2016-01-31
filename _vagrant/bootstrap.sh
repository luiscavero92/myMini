#!/usr/bin/env bash

# Use single quotes instead of double quotes to make it work with special-character passwords

# Contraseña de la base de datos
PASSWORD='123'

# Nombre del archivo sql de la base de datos (debe encontrarse en la carpeta _install)
DATABASE_SQL='database.sql'

# Directorio del proyecto (donde se instalarán los repositorios de github)
PROJECTFOLDER='myproject'

# Repositorios propios, puedes poner la url de tu propio repositorio github
GIT_REPOS='https://github.com/luiscavero92/myMini'
# Cambiar por el de abajo para instalar el mini original
# GIT_REPOS = 'https://github.com/panique/mini'

sudo apt-get update
sudo apt-get -y upgrade
# Instalación de apache2 (-y para no pedir confirmación)
echo -e "\n ===== Instalando Apache2: =====\n" 
sudo apt-get install -y apache2

# Actualización e instalación de php 5.6
echo -e "\n ===== Instalando php5: =====\n" 
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ondrej/php5-5.6
sudo apt-get update
sudo apt-get install -y php5
echo -e "\n===== Version de php: =====\n" 
php5 -v
echo -e "\n=========================\n"

# Instalación de mysql
echo -e "\n===== Instalando mysql: =====\n" 
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server
sudo apt-get install -y php5-mysql

# Instalación de phpmyadmin
echo -e "\n===== Instalando phpmyadmin: =====\n" 
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get -y install -y phpmyadmin

# Creación del directorio del proyecto
sudo mkdir "/var/www/html/${PROJECTFOLDER}"

# Creación del host
VHOST=$(cat <<EOF
<VirtualHost *:80>
    DocumentRoot "/var/www/html/${PROJECTFOLDER}/public"
    <Directory "/var/www/html/${PROJECTFOLDER}/public">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

# Habilita el módulo reescritura para urls amigables
sudo a2enmod rewrite

# Reinicia apache
service apache2 restart

# Elimina el index.html por defecto de apache
sudo rm "/var/www/html/index.html"

# Instala git
echo -e "\n===== Instalando Git: =====\n" 
sudo apt-get install -y git

# Descarga mis repositorios de git en el directorio del proyecto
echo -e "\n===== Clonando repositorios Git: =====\n" 
sudo git clone "${GIT_REPOS}" "/var/www/html/${PROJECTFOLDER}"

# Instalación de composer
echo -e "\n===== Instalando Composer: =====\n" 
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Instalación de los paquetes incluidos en composer
echo -e "\n===== Instalando paquetes de Composer: =====\n" 
cd "/var/www/html/${PROJECTFOLDER}"
composer install

# Carga la base de datos a partir del archivo database.sql
echo -e "\n===== Cargando la base de datos: =====\n" 
sudo mysql -h "localhost" -u "root" "-p${PASSWORD}" < "/var/www/html/${PROJECTFOLDER}/_install/${DATABASE_SQL}"

# Copia la contraseña de la base de datos en el archivo de configuración -> define('DB_PASS', 'your_password');
sudo sed -i "s/your_password/${PASSWORD}/" "/var/www/html/${PROJECTFOLDER}/application/config/config.php"

# Mensaje final
echo -e "\n===== Voilá =====\n" 

# myMini
Repositorios de mi máquina mini<br/><br/>
Instala una máquina vagrant con las características del proyecto original "panique/mini" y algunas modificaciones añadidas.<br/><br/>
La máqina viene totalmente preparada para trabajar sin necesidad de realizar ninguna operación adicional.<br/>
Incluye php 5.6, Composer y los paquetes: Plates, Dice, Kint y Phpmailer<br/>
<br/>
Para generar la máquina, seguir estos pasos:<br/>
0 - Instalar Vagrant<br/>
1 - Descargar los archivos "Vagrantfile" y "Boostrap" que se encuentran en la carpeta _vagrant<br/>
2 - Mover ambos archivos a la carpeta donde queréis crear la máquina<br/>
3 - Instalar la box Trusty64 (o cambiar la box en el archivo Vagrantfile)<br/>
4 - Ejecutar el comando "vagrant up" desde una consola situada en dicha carpeta<br/>
<br/>
Los archivos "Vagrantfile" y "Boostrap" están traducidos (en la medida de lo posible) para que puedan ser<br/>
fácilmente personalizables, algunas características importantes son:<br/>
<br/>
Vagrantfile<br/>
   Box a utilizar<br/>
<br/>
Boostrap<br/>
- Contraseña de la base de datos<br/>
- Archivo .sql con la base de datos<br/>
- Repositorio Git a clonar (podéis poner los repositorios mini originales, pero perdereis Composer y sus paquetes)<br/>


# myMini
Repositorios de mi máquina mini<br/><br/>
Instala una máquina vagrant con las características del proyecto original "panique/mini" y algunas modificaciones añadidas.<br/><br/>
La máqina viene totalmente preparada para trabajar sin necesidad de realizar ninguna operación adicional.<br/>

Algunas de las modificaciones sobre el proyecto mini original son:<br/>
0 - Incluye php 5.6, Composer y los paquetes: Plates, Dice, Kint y Phpmailer<br/>
1 - Utiliza la nomenclatura StudlyCaps en los nombres de los archivos de clases, evitando problemas de autoload en sistemas Linux<br/>
2 - Utiliza, por convención, la nomenclatura camealCase en los nombres del resto de archivos<br/>
3 - El directorio "plates" ha sido suprimido ya que su funcionalidad era meramente educativa, las plantillas cuelgan directamente del directorio "view", aunque puede cambiarse desde core/Aplication.phpPONER LINEA<br/>
4 - La clase View-Old también ha sido suprimida ya que únicamente incluía una clase obsoleta<br/>
5 - Está adaptada hasta la última clase de MVC<br/>
<br/>
<b>Para generar la máquina, seguir estos pasos:</b><br/>
<i>Los pasos 0 y 3 son omitibles si ya tienes vagrant instalado y la box Trusty64 instalada, puedes consultar tus box instaladas con el comando "vagrant box list"</i><br/>
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
0 -  Box a utilizar(Por defecto: ubuntu/trusty64)<br/>
<br/>
Boostrap<br/>
0 - Contraseña de la base de datos(Por defecto: 123)<br/>
1 - Archivo .sql con la base de datos(Por defecto: database.sql)<br/>
2 - Repositorio Git a clonar (podéis poner los repositorios mini originales, pero perdereis Composer y sus paquetes)<br/>


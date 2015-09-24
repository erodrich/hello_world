# Taxi Xpress

Instrucciones

 - Para correr en c9.io debe modificar el archivo database.yml descomentando las siguientes lineas:

  username: <%=ENV['C9_USER']%>
  password:
  host: <%=ENV['IP']%>

 - Luego debe ejecutar:
 		bundle install
 - Por ultimo:
 		rake db:create

------------------------------------
URL de Administracion es:

- http://[host]/admin
- correo: admin@taxixpress.com
- password: admin01

------------------------------------
La base de datos ya cuenta con usuarios y choferes
La cuenta de los choferes esta desactivada
El administrador puede asignar servicios a choferes

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
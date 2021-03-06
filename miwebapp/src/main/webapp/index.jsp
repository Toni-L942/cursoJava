<%@ page import="es.caixa.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.*" %>


<html>
    <head>
        <title>Mi pagina</title>
    </head>
    <body>
        <h1>Soy más grande!</h1>
        <h2>Yo más pequeño!</h2>
        
        <jsp:scriptlet>
            // Codigo JAVA
            // int numero1=7;
            // int numero2=12;
            // int suma=numero1+numero2;
        GestorUsuarios miGestor=new GestorUsuarios();

        // Dar de alta 2 usuarios en el gestor de usuarios (datos fijos)
        Usuario ivan=miGestor.newUsuario("ivan.osuna.ayuste@gmail.com");
        ivan.setNombre("Ivan");
        ivan.setApellidos("Osuna");
        ivan.setEdad(39);
        miGestor.datosUsuarioModificados(ivan);
        
        // Recuperar 1 de ellos e imprimirlo por la consola
        Usuario ivanRecuperado=miGestor.getUsuario("ivan.osuna.ayuste@gmail.com");
        </jsp:scriptlet>
    
        <!-- <p>Resultado de la suma:  </p> -->
        <img src="imagenes/alien.png" height="10"/>
        <p>Usuario:</p>
        <ul>
            <li>Nombre: <jsp:expression>ivanRecuperado.getNombre()</jsp:expression> </li>
            <li>Apellido: <jsp:expression>ivanRecuperado.getApellidos()</jsp:expression> </li>
            <li>Edad: <jsp:expression>ivanRecuperado.getEdad()</jsp:expression> </li>
            <li>Email: <jsp:expression>ivanRecuperado.getEmail()</jsp:expression> </li>
        </ul>
        
<jsp:scriptlet>
  Properties miconfiguracion = new Properties();
        try{
             InputStream miFicheroConfiguracion = Thread.currentThread().getContextClassLoader().getResourceAsStream("configuracion.properties");
             miconfiguracion.load(miFicheroConfiguracion);
             miFicheroConfiguracion.close();
        }catch(Exception e){
             e.printStackTrace(response.getWriter());
}
        </jsp:scriptlet>
        <p>Empresa: <jsp:expression>miconfiguracion.get("empresa")</jsp:expression> </p>
    </body>
</html>

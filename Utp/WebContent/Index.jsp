<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import='java.util.Date' %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
 
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Daily UI #028 Contact Us</title>
  <link rel="stylesheet" href="dist/style.css">
</head>
<!-- partial:index.partial.html -->
<body>
   <div id="container"></div>
  <script id="template">
    <div class="flip-card" on-click="toggle('flipCard')"> {{ flipCard ? 'Reset' : 'Animate' }} </div>
    <div class="contact-wrapper">
        <div class="envelope {{ flipCard ? 'active' : '' }}">
          <div class="back paper"></div>
          <div class="content">
            <div class="form-wrapper">            
            <form action="" method="post">
              <!--codigo-->  
              <div class="top-wrapper">
                  <div class="input">
                    <label>Name</label>
                    <input type="text" name="nombre"/>
                    	</div>
                  <div class="input">
                    <label>Phone</label>
                    <input type="text" name="numero"/>
                  </div>
                  <div class="input">
                    <label>Email</label>
                    <input type="text" name="email"/>
                  </div> 
                </div>
                <div class="bottom-wrapper">
                  <div class="input">
                    <label>Subject</label>
                    <input type="text" name="tema"/>
                  </div>
                  <div class="input">
                    <label>Message</label>
                    <textarea rows="5" name="comentario"></textarea>
                    </div>
                    <!--boton-->
                    <div class="submit">
                    <button type="submit" class="submit-card" on-click="toggle('flipCard')">
                    </button></div>
                    </div>
                </form>
            </div>
          </div>
          <div class="front paper"></div>
        </div>
      </div>
    </script>
</body>
<!-- partial -->
  <script src='https://cdn.jsdelivr.net/npm/ractive@0.9'></script><script  src="dist/script.js"></script>

</html>

 <% try{
	 
	  //CONECTANOD A LA BASE DE DATOS:
	  Connection con;
	  String url="jdbc:mysql://localhost:3306/email";
	  String Driver="com.mysql.jdbc.Driver";
	  String user="root";
	  String clave="";
	  Class.forName(Driver);
	  con=DriverManager.getConnection(url,user,clave);
	  PreparedStatement ps;
	  String nom,num,email,tema,comentario;
	  nom=request.getParameter("nombre");
	  num=request.getParameter("numero"); 
	  email=request.getParameter("email");
	 tema=request.getParameter("tema");
	 
	  comentario=request.getParameter("comentario");
	  if(nom!=null && num!=null&& email!=null&& tema!=null && comentario!=null){
	      ps=con.prepareStatement("insert into usuarios(nombre,numero,email,tema,comentario)values('"+nom+"','"+num+"','"+email+"','"+tema+"','"+comentario+"')");
	      ps.executeUpdate();
	     /* "Se Agrego Correctamete"*/           
	      /*response.sendRedirect("datos.jsp");*/
	  }
}catch(Exception ex){
				out.println("error de "+ex.getMessage().toString());
			}
			%>



    
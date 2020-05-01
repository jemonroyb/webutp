<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
<!DOCTYPE html>
</html>
<body>
      <!--editado  -->
 <% 
    	  
           //CONECTANOD A LA BASE DE DATOS:
        	 Connection con;      
           String url="jdbc:mysql://localhost:3306/bd_practica";
           String Driver="com.mysql.jdbc.Driver";
           String user="root";
           String clave="";
           Class.forName(Driver);
           con=DriverManager.getConnection(url,user,clave);
           //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
           PreparedStatement ps;       
           int id=Integer.parseInt(request.getParameter("id"));
           ps=con.prepareStatement("delete from persona where Id="+id);
           ps.executeUpdate();
           response.sendRedirect("index.jsp");
          				
           %>
			
    </body>
</html>
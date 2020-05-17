<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refrest" content="0; url=index.jsp">
<title>Insert title here</title>
</head>
<body>
<%
out.println("el año recogifo es: "+request.getParameter("anio"));
out.println("el mes recogido es: "+request.getParameter("mes")); 
out.println("el dia recodigo es:"+request.getParameter("dia"));
out.println("el calendario recogido es "+request.getParameter("calendario"));
out.println("la hora recogido es "+request.getParameter("hora"));
out.println("el minuto recogido es "+request.getParameter("minuto"));
out.println("la duracion recogido es "+request.getParameter("duracion"));
out.println("el nombre recogido es " + request.getParameter("nombre"));

%>

<% try{
				String conexion = "jdbc:mysql://localhost:3306/webcalendario";
				Connection connection=null;
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				connection=DriverManager.getConnection(conexion,"web","calendario");
				
				//segunda parte
				
				Statement stmt =connection.createStatement();
				stmt.executeUpdate("INSERT INTO eventos VALUES(NULL,"+request.getParameter("calendario")+","+request.getParameter("nombre")+","+request.getParameter("anio")+","+request.getParameter("mes")+","+request.getParameter("dia")+","+request.getParameter("hora")+","+request.getParameter("minuto")+",0,"+request.getParameter("duracion")+")");
				
				
				
				stmt.close();
				connection.close();
				
			}catch(Exception ex){
				out.println("error de "+ex.getMessage().toString());
			}
			%>




</body>
</html>
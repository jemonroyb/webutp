<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refrest" content="0; url=/index.jsp"/>
<title>Insert title here</title>
</head>
<body>


<% try{
				String conexion = "jdbc:mysql://localhost:3306/webcalendario";
				Connection connection=null;
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				connection=DriverManager.getConnection(conexion,"web","calendario");
				
				//segunda parte
				
				Statement stmt =connection.createStatement();
				stmt.executeUpdate("DELETE FROM eventos WHERE idevento= "+request.getParameter("idevento")+"");
				
				
				
				stmt.close();
				connection.close();
				
			}catch(Exception ex){
				out.println("error de "+ex.getMessage().toString());
			}
			%>
</body>
</html>
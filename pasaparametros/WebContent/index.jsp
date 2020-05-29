<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% java.text.DateFormat fecha= new SimpleDateFormat("dd/MM/yyyy"); %>
<form method="get" action="controlador">
<input type="text" name="nombre" value="Nonbre"><br><br> 
<input type="text" name="email" value="Email"><br><br> 
<input type="text" name="fecha" value="<% fecha.format(new java.util.Date()); %>"><br><br> 
<input type="submit">
</form>
<a href="mostrar">hacer clic </a> 



</body>
</html>
package com.Utp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;



/**
 * Servlet implementation class controlador
 */
@WebServlet("/controlador")
public class controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private java.sql.Connection conexion =null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controlador() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter mensajes=response.getWriter();
		mensajes.println(" voy a recibir la  información");
		mensajes.println("el nombre que has enviado es:"+request.getParameter("nombre")+"<br>");
		mensajes.println("el email que has enviado es:"+request.getParameter("email")+"<br>");
		mensajes.println("el fecha que has enviado es:"+request.getParameter("fecha")+"<br>");
		
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conexion=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/agenda1","root","");
			Statement s =conexion.createStatement();
			s.executeUpdate("INSERT INTO usuarios VALUES (NULL,'"+request.getParameter("nombre")+"','"+request.getParameter("email")+"','"+request.getParameter("fecha")+"')");
			mensajes.println("suu registro se guardo");
			conexion.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	
	}

	
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

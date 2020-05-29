package com.Utp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mostrar
 */
@WebServlet("/mostrar")
public class mostrar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private java.sql.Connection conexion =null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mostrar() {
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
		mensajes.println("<table border=1>");	
		try {
		
			Class.forName("com.mysql.jdbc.Driver");
			conexion=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/agenda1","root","");
			Statement s =conexion.createStatement();
			ResultSet resultado=s.executeQuery("SELECT * FROM usuarios");
			
			while (resultado.next()) {
				mensajes.println("<tr><td>"+resultado.getObject("idUsuario")+"</td></td>"+"<td>"+resultado.getObject("nombre")+"</td>"+"<td>"+resultado.getObject("email")+"</td>"+"<td>"+resultado.getObject("fecha")+"</td>");
				
			}
					
		conexion.close();
	} catch (Exception e) {
		e.printStackTrace();
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

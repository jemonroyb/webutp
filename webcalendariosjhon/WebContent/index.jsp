<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			Septiembre2014		
		</title>	
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="http://webcalendario.com/favicons/09.ico">	
		<script src="lib/jquery-1.10.1.min.js"></script>
		<script src="lib/jquery-ui.js"></script>
		<script src="js/codigo.js">
		
		</script>
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<link rel="stylesheet" type="text/css" href="css/header.css">
	</head>
	<body>
	<div id="tituloprint">www.webcalendario.com</div>
	<header>
		<div id="logo">
			
				<h1>webcalendario.com</h1>
				<h2>Tu calendario en la nube</h2>
			</div>
			<nav>
				<ul>
					<li>
						Inicio
					</li>
					<li>
						FAQ
					</li>
					<li id="botonlogin">
						Inicia sesion
					</li>
					<li id="botonsignin">
						Reg�strate
					</li>
					<li id="contacto">
						Contacto
					</li>
					<li id="contacto">
						<a href="">Cerrar Sesion</a>
					</li>
				</ul>
			</nav>
	</header>
	<table width="100%">
	<tbody><tr>
	<td id="aniotitulo">
		<h2>abril</h2><h1>2020</h1></td>
		<td id="botones">
			<a href="http://webcalendario.com/"><button> &lt;&lt; </button></a>
			<a href="./webcalendario_files/webcalendario.html"><button> &gt;&gt; </button></a>
		</td>
		<td>
			<div id="calendarios">
			<!-- modificdo calendarioss -->
			<!--
				<span class="calendariocol" idcalendario="1" style="width:80px;background:#9fb6ff;">Calendario1</span>
				<span class="calendariocol" idcalendario="1" style="width:80px;background:#9fb6ff;">Calendario2</span>
			-->
			<% try{
				String conexion = "jdbc:mysql://localhost:3306/webcalendario";
				Connection connection=null;
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				//usuario=web  password=calendario
				connection=DriverManager.getConnection(conexion,"web","calendario");
				
				//segunda parte
				
				Statement stmt =connection.createStatement();
				ResultSet rset;
				
				String peticion="select*From calendarios";
				rset=stmt.executeQuery(peticion);
				while(rset.next()){
					out.println("<span class='calendariocol' idcalendario='1' style='width:80px;background:rgb("+rset.getString("color")+");'>"+rset.getString("nombre")+"</span>");
				}
				stmt.close();
				connection.close();
				
			}catch(Exception ex){
				out.println("error de "+ex.getMessage().toString());
			}
			%>
			
			
			
			
			</div>
			<span class="calendariocol" style="background:grey;" id="ocultacalendarios"> &gt; </span>
			</td>
		</tr>
		</tbody></table>
		<div style="clear:both;"></div>
		<div id="calendario">
		<!--optimizado-->
		<%  
		
		try{
			String conexion = "jdbc:mysql://localhost:3306/webcalendario";
			Connection connection=null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection=DriverManager.getConnection(conexion,"web","calendario");
			
			//segunda parte
			
			Statement stmt =connection.createStatement();
			ResultSet rset;
			
		//agregar for 
		
			for (int dia=1; dia<=31; dia++){
				String peticion = "SELECT idevento,eventos.nombre AS nombre,anio,mes,dia,hora,minuto,segundos,duracion,color FROM eventos LEFT JOIN calendarios ON eventos.calendario=calendarios.idcalendario WHERE anio=2014 AND mes=9 AND dia="+dia+"";
				rset = stmt.executeQuery(peticion);
				out.println("<div class='dia ui-droppable' dia="+dia+" style='position:relative;''><div class='numerodia'><b>"+dia+"</b></div>");
				while(rset.next()){
				out.println("<div idcaldia='7' anio='2014' mes='5' dia='5' hora='9' nombre='IMF' class='evento ui-draggable' style='background:rgb("+rset.getString("color")+");width:90%;height:"+(rset.getInt("duracion")*0.1)+"%;position:absolute;top:"+((rset.getInt("hora")*4)+12)+"%;'>9:0-15:00<span class='motivoevento'>-Evento 1</span><div class='eliminar'><a style='color:#d7d7d7;' href='eliminarEvento.jsp?idevento="+rset.getInt("idevento")+"'>X</a></div></div>");
				}
				out.println("</div>");
			}
			stmt.close();
			connection.close();
			
		}catch(Exception ex){
			out.println("error de "+ex.getMessage().toString());
		}
		
		%>
		<!--  
			<div class="dia ui-droppable" dia="1" style="position:relative;"><div class="numerodia"><b>1</b></div></div>
			<div class="dia ui-droppable" dia="2" style="position:relative;"><div class="numerodia"><b>2</b></div></div>
			<div class="dia ui-droppable" dia="3" style="position:relative;"><div class="numerodia"><b>3</b></div></div>
			<div class="dia ui-droppable" dia="4" style="position:relative;"><div class="numerodia"><b>4</b></div></div>
			<div class="dia ui-droppable" dia="5" style="position:relative;"><div class="numerodia"><b>5</b></div></div>
			<div class="dia ui-droppable" dia="6" style="background:rgba(0,0,0,0.2);position:relative;"><div class="numerodia"><b>6</b></div></div>
			<div class="dia ui-droppable" dia="7" style="background:rgba(0,0,0,0.2);position:relative;"><div class="numerodia"><b>7</b></div></div>
			<div style="clear:both;"></div>
			<div class="dia ui-droppable" dia="8" style="position:relative;"><div class="numerodia"><b>8</b></div></div>
			<div class="dia ui-droppable" dia="9" style="background:white !important;position:relative;"><div class="numerodia"><b>9</b></div></div>
			<div class="dia ui-droppable" dia="10" style="position:relative;"><div class="numerodia"><b>10</b></div></div>
			<div class="dia ui-droppable" dia="11" style="position:relative;"><div class="numerodia"><b>11</b></div></div>
			<div class="dia ui-droppable" dia="12" style="position:relative;"><div class="numerodia"><b>12</b></div></div>
			<div class="dia ui-droppable" dia="13" style="background:rgba(0,0,0,0.2);position:relative;">
				<div class="numerodia"><b>13</b></div>
				<div idcaldia="7" anio="2014" mes="9" dia="13" hora="9" nombre="IMF" class="evento ui-draggable" style="background:#d7d7d7;width:90%;height:19.2%;position:absolute;top:48%;">
					9:0-15:00
						<span class="motivoevento">
							-Evento 1
						</span>
						<div class="eliminar">
							<a style="color:#d7d7d7;" href="http://webcalendario.com/php/calendario.php?operacion=eliminar&anio=2014&mes=9&dia=13&nombre=IMF">
								X
							</a>
						</div>
					</div>
				</div>
			<div class="dia ui-droppable" dia="14" style="background:rgba(0,0,0,0.2);position:relative;"><div class="numerodia"><b>14</b></div></div>
			<div style="clear:both;"></div><div class="dia ui-droppable" dia="15" style="position:relative;"><div class="numerodia"><b>15</b></div></div>
			<div class="dia ui-droppable" dia="16" style="position:relative;"><div class="numerodia"><b>16</b></div></div>
			<div class="dia ui-droppable" dia="17" style="position:relative;"><div class="numerodia"><b>17</b></div></div>
			<div class="dia ui-droppable" dia="18" style="position:relative;"><div class="numerodia"><b>18</b></div></div>
			<div class="dia ui-droppable" dia="19" style="position:relative;"><div class="numerodia"><b>19</b></div></div>
			<div class="dia ui-droppable" dia="20" style="background:rgba(0,0,0,0.2);position:relative;"><div class="numerodia"><b>20</b></div></div>
			<div class="dia ui-droppable" dia="21" style="background:rgba(0,0,0,0.2);position:relative;"><div class="numerodia"><b>21</b></div></div>
			<div style="clear:both;"></div><div class="dia ui-droppable" dia="22" style="position:relative;"><div class="numerodia"><b>22</b></div></div>
			<div class="dia ui-droppable" dia="23" style="position:relative;"><div class="numerodia"><b>23</b></div></div>
			<div class="dia ui-droppable" dia="24" style="position:relative;"><div class="numerodia"><b>24</b></div></div>
			<div class="dia ui-droppable" dia="25" style="position:relative;"><div class="numerodia"><b>25</b></div></div>
			<div class="dia ui-droppable" dia="26" style="position:relative;"><div class="numerodia"><b>26</b></div></div>
			<div class="dia ui-droppable" dia="27" style="background:rgba(0,0,0,0.2);position:relative;"><div class="numerodia"><b>27</b></div></div>
			<div class="dia ui-droppable" dia="28" style="background:rgba(0,0,0,0.2);position:relative;"><div class="numerodia"><b>28</b></div></div>
			<div style="clear:both;"></div><div class="dia ui-droppable" dia="29" style="position:relative;"><div class="numerodia"><b>29</b></div></div>
			<div class="dia ui-droppable" dia="30" style="position:relative;"><div class="numerodia"><b>30</b></div></div>
			<div class="dia ui-droppable" dia="31" style="position:relative;"><div class="numerodia"><b>31</b></div></div>
			-->
			</div>
			<div id="nuevoevento" style="display: none;">
				<div id="contieneform">
					<div id="cerrarnuevoevento">X</div>
					<form action="http://localhost:8080/webcalendariosjhon/Nuevoevento.jsp?evento=nuevo" method="POST">
					<input type="hidden" name="anio" value="2014">
						<input type="hidden" name="mes" value="9">
						<h3>Nuevo evento</h3>
					<table width="100%" id="tablanuevoevento" cellpadding="0" cellspacing="0">
						<tbody><tr>
							<td>
								A�o:
							</td>
							<td>
								2014							</td>
						</tr>
						<tr>
							<td>
							Mes:	
							</td>
							<td>
								Sep							</td>
						</tr>
						<tr>
							<td>
								Dia:
							</td>
							<td>
								<input type="text" name="dia" id="dimedia">
							</td>
						</tr>
						<tr>
							<td>
								Calendario:
							</td>
							<td>
								<select name="calendario">
									<% try{
										String conexion = "jdbc:mysql://localhost:3306/webcalendario";
										Connection connection=null;
										Class.forName("com.mysql.jdbc.Driver").newInstance();
										//usuario=web  password=calendario
										connection=DriverManager.getConnection(conexion,"web","calendario");
										
										//segunda parte
										
										Statement stmt =connection.createStatement();
										ResultSet rset;
										
										String peticion="select*From calendarios";
										rset=stmt.executeQuery(peticion);
										while(rset.next()){
											out.println("<option value='"+rset.getInt("idcalendario")+"'>"+rset.getString("nombre")+"</option>");
										}
										stmt.close();
										connection.close();
										
									}catch(Exception ex){
										out.println("error de "+ex.getMessage().toString());
									}
									%>
								
								</select>
							</td>
						</tr>
						<tr>
							<td>
								Hora de inicio:
							</td>
							<td>
								<select name="hora">
								<!--optimizado!!!-->
					<!--  	<option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option>	-->
								
						<%for (int hora=0; hora<=24;hora++){
							out.println("<option value="+hora+">"+hora+"</option>");	
						} %>
						</select>:
						<select name="minuto">
						<!--optimizado!!!-->
					<!--<option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option>-->
							
							<%for(int minuto=0; minuto<=60; minuto++){
								out.println("<option value="+minuto+">"+minuto+"</option>");
							} %>
							</select>
							</td>
						</tr>
						<tr>
							<td>
								Duraci�n:
							</td>
							<td>
								<select name="duracion">
						<option value="0">0</option><option value="30">0:30</option><option value="60">1</option><option value="90">1:30</option><option value="120">2</option><option value="150">2:30</option><option value="180">3</option><option value="210">3:30</option><option value="240">4</option><option value="270">4:30</option><option value="300">5</option><option value="330">5:30</option><option value="360">6</option><option value="390">6:30</option><option value="420">7</option><option value="450">7:30</option><option value="480">8</option><option value="510">8:30</option><option value="540">9</option><option value="570">9:30</option><option value="600">10</option><option value="630">10:30</option><option value="660">11</option><option value="690">11:30</option><option value="720">12</option><option value="750">12:30</option><option value="780">13</option><option value="810">13:30</option><option value="840">14</option><option value="870">14:30</option><option value="900">15</option><option value="930">15:30</option><option value="960">16</option><option value="990">16:30</option><option value="1020">17</option><option value="1050">17:30</option><option value="1080">18</option><option value="1110">18:30</option><option value="1140">19</option><option value="1170">19:30</option><option value="1200">20</option><option value="1230">20:30</option><option value="1260">21</option><option value="1290">21:30</option><option value="1320">22</option><option value="1350">22:30</option><option value="1380">23</option><option value="1410">23:30</option>						</select>
							</td>
						</tr>
						<tr>
							<td>
								Nombre del evento:
							</td>
							<td>
								<input type="text" name="nombre">
							</td>
						</tr>
						<tr>
							<td>
								
							</td>
							<td>
								<input type="submit">
							</td>
						</tr>
						
					</tbody></table>	
				</form>
			</div>
		</div>
		<div id="ajax"></div>
	
</body></html>

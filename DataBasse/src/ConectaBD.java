import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.faces.context.FacesContext;

public class ConectaBD {
	private Connection conexion = null;
	private String servidor = "localhost";
	private String database = "materiasingcomp";
	private String usuario = "root";
	private String password = "";
	private String url = "";

	public ConectaBD() {
		try {
			// Establece la conexión con la base de datos
			Class.forName("com.mysql.jdbc.Driver");
			url = "jdbc:mysql://" + servidor + "/" + database;
			conexion = DriverManager.getConnection(url, usuario, password);
		} catch (SQLException | ClassNotFoundException ex) {
			
		}
	}

	public Connection getConexion() {
		return conexion;
	}

	public Connection cerrarConexion() {
		try {
			conexion.close();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		conexion = null;
		return conexion;
	}

	

}

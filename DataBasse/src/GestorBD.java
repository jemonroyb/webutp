import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class GestorBD {
	private Connection conexion = null;
	private Statement stm = null;
	private ResultSet ueaResultSet;
	private Integer clave, trimestre;
	private String nombre, requisito;

	public ArrayList<Uea> leerUeas() {
		ArrayList<Uea> ueas = new ArrayList<Uea>();
		Uea ueaHallada;
		try {
			ConectaBD conectaBD = new ConectaBD();
			conexion = conectaBD.getConexion();
			stm = conexion.createStatement();
			ueaResultSet = stm.executeQuery("select * from ueas");
			if (!ueaResultSet.next()) {
				System.out.println(" No se encontraron registros");
				conexion.close();
				return null;
			} else {
				do {
					clave = ueaResultSet.getInt("clave");
					nombre = ueaResultSet.getString("nombre");
					trimestre = ueaResultSet.getInt("trimestre");
					requisito = ueaResultSet.getString("requiere");
					ueaHallada = new Uea(clave, nombre, trimestre, requisito);
					ueas.add(ueaHallada);
				} while (ueaResultSet.next());
				conexion.close();
				return ueas;
			}
		} catch (Exception e) {
			System.out.println("Error en la base de datos.");
			e.printStackTrace();
			return null;
		}
	}
}
package log.ministerio.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConexion {

	public static Connection getConectar() {
		Connection cn=null;
		try {
			String url,user,pass;
			//carga de la clase que se encuentra en el jar "mysql-connector-java-8.0.21.jar"
			Class.forName("com.mysql.cj.jdbc.Driver");

			//cambia el nro de tu puerto.
			url="jdbc:mysql://localhost:3306/MINISTERIOPUBLICO_GLOGISTICA?serverTimezone=UTC";
			user="root";
			pass="mysql";  //
			//establacer la conexión a la BD. 
			cn=DriverManager.getConnection(url,user,pass);

		} catch (ClassNotFoundException e) {
			System.out.println("Error del Driver...no adicionado");
			e.printStackTrace();

		} catch (SQLException e) {
			System.out.println("Error de conexion a la BD");
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error..."+e.getMessage());
		}
		return cn;
	}
}

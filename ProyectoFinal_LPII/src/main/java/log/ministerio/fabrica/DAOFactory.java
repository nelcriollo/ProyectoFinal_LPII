package log.ministerio.fabrica;

import log.ministerio.interfaces.AccesoInterfaceDAO;
import log.ministerio.interfaces.BienInterfaceDAO;
import log.ministerio.interfaces.MenuInterfaceDAO;
import log.ministerio.interfaces.ProveedorInterfaceDAO;
import log.ministerio.interfaces.TipoBienInterfaceDAO;
import log.ministerio.interfaces.UsuarioInterfaceDAO;

public abstract class DAOFactory {
	//or�gen de datos.
	public static final int MYSQL=1;
	public static final int SQLSERVER = 2;

	//regisytramos nuestros DAO
	public abstract UsuarioInterfaceDAO getUsuarioInterfaceDAO();
	public abstract MenuInterfaceDAO getMenuInterfaceDAO();
	public abstract AccesoInterfaceDAO getAccesoInterfaceDAO();
	public abstract ProveedorInterfaceDAO getProveedorInterfaceDAO();
	
	public abstract BienInterfaceDAO getBienInterfaceDAO();
	public abstract TipoBienInterfaceDAO getTipoBienInterfaceDAO();

	public static DAOFactory getDAOFactory(int whichFactory) {

		switch (whichFactory) {
		case MYSQL: 

			return new MySqlDAOFactory();
		case SQLSERVER: 

			//return new SqlServerDAOFactory;

		default:
			return null;
		}

	}

}

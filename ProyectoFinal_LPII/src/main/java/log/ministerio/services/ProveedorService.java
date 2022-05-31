package log.ministerio.services;

import java.util.List;

import log.ministerio.entidad.Proveedor;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.ProveedorInterfaceDAO;

public class ProveedorService {	
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	private ProveedorInterfaceDAO objProveedor=fabrica.getProveedorInterfaceDAO();
	
	public int registrar(Proveedor bean) {
		return objProveedor.RegistrarProveedor(bean);
	}
	public int actualizar(Proveedor bean) {
		return objProveedor.ActualizarProveedor(bean);
	}
	public int eliminarPorId(int idPro) {
		return objProveedor.EliminarProveedor(idPro);
	}
	public List<Proveedor> listarTodos(){
		return objProveedor.listAll();
	}
}

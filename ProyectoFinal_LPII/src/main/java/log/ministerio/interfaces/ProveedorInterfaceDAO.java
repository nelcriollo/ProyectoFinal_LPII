package log.ministerio.interfaces;

import java.util.List;

import log.ministerio.entidad.Proveedor;

public interface ProveedorInterfaceDAO {
	
	public int RegistrarProveedor(Proveedor bean);
	public int ActualizarProveedor(Proveedor bean);
	public int EliminarProveedor(int idProd);
	public List<Proveedor> listAll();
	

}

package log.ministerio.services;

import java.util.List;

import log.ministerio.entidad.MovimientoAlmacen;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.MovimientoAlmacenInterfaceDAO;

public class MovimientoAlmacenService {
	
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	private MovimientoAlmacenInterfaceDAO objMovimientoAlmacen=fabrica.getMovimientoAlmacenInterfaceDAO();
	
	public int registrar(MovimientoAlmacen bean,int tipoMovimiento,int Cod_bien,int Cantidad) {
		return objMovimientoAlmacen.RegistrarMovimientoAlmacen(bean,tipoMovimiento,Cod_bien,Cantidad);
	}
	public int actualizar(MovimientoAlmacen bean) {
		return objMovimientoAlmacen.ActualizarMovimientoAlmacen(bean);
	}
	public int eliminarPorId(int idCodMov) {
		return objMovimientoAlmacen.EliminarMovimientoAlmacen(idCodMov);
	}
	public List<MovimientoAlmacen> listarTodos(){
		return objMovimientoAlmacen.listAll();
	}
	public MovimientoAlmacen buscarCodigoMovimiento(int idCodMov) {
		return objMovimientoAlmacen.findById(idCodMov);
	}

}

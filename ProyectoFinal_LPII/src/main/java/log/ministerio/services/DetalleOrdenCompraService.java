package log.ministerio.services;

import java.util.List;

import log.ministerio.entidad.DetalleOrdenCompra;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.DetalleOrdenCompraInterfaceDAO;

public class DetalleOrdenCompraService {
	
	private DAOFactory fabrica = DAOFactory.getDAOFactory(1);
	private DetalleOrdenCompraInterfaceDAO objDtOc=fabrica.getDetalleOrdenCompraInterfaceDAO();
	
	
	public List<DetalleOrdenCompra> ListarOrdenCompra_con_DetalleOC(){
		return objDtOc.list_OC_Detalle();
	}
}

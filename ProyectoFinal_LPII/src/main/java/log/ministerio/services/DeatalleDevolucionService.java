package log.ministerio.services;

import java.util.List;

import log.ministerio.entidad.DetalleDevolucion;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.DetalleDevolucionInterfaceDAO;

public class DeatalleDevolucionService {
	private DAOFactory fabrica = DAOFactory.getDAOFactory(1);
	private DetalleDevolucionInterfaceDAO objDtDevol=fabrica.getDetalleDevolucionInterfaceDAO();
	
	public List<DetalleDevolucion> listarDetalleDevolucion_Por_codigo_Devolucion(int cod){
	
		return objDtDevol.ListarDetalleDevolucionPorCodDevol(cod);
	}
	
	public int EliminarDetalleDevolucion_ActualizarMontoAdeudadoDevolucion(int codDetalle,String nrofichaDevol,double nuevoMonto) {
		return objDtDevol.Delete(codDetalle, nrofichaDevol, nuevoMonto);
	}

}

package log.ministerio.services;

import java.util.List;

import log.ministerio.entidad.TipoMovimiento;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.TipoMovimientoInterfaceDAO;

public class TipoMovimientoService {

	private DAOFactory fabrica = DAOFactory.getDAOFactory(1);
	private TipoMovimientoInterfaceDAO objTipoMovimiento=fabrica.getTipoMovimientoInterfaceDAO();
	
	public List<TipoMovimiento> listarTipoMovimiento(){
		return objTipoMovimiento.listAll();
	}

}

package log.ministerio.services;

import java.util.List;

import log.ministerio.entidad.TipoBien;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.TipoBienInterfaceDAO;

public class TipoBienService {

	private DAOFactory fabrica = DAOFactory.getDAOFactory(1);
	private TipoBienInterfaceDAO objTipoBien=fabrica.getTipoBienInterfaceDAO();
	
	public List<TipoBien> ListarTipoBienes(){
		return objTipoBien.listAll();
	}
}

package log.ministerio.services;

import java.util.List;

import log.ministerio.entidad.DetalleDevolucion;
import log.ministerio.entidad.Devolucion;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.DevolucionInterfaceDAO;

public class DevolucionService {
	private DAOFactory fabrica = DAOFactory.getDAOFactory(1);
	private DevolucionInterfaceDAO objDevol=fabrica.getDevolucionInterfaceDAO();
	
	public int RegistrarDevolucion(Devolucion bean, List<DetalleDevolucion> lista) {
		return objDevol.save(bean, lista);
	}
	public List<Devolucion> listarDevoluciones(){
		return objDevol.listAll();
	}
	public String NumeroFichaDevolucion() {
		return objDevol.GenerarNuemroDevolucion();
	}
	public Devolucion listarDevoluciones_Por_Codigo(int cod) {
		return objDevol.ListarDevol_Por_Codigo(cod);
	}
	public int EmininarDevolucion(int cod) {
		return objDevol.delete(cod);
	}
	public int ActualizarDevolucion(Devolucion bean) {
		return objDevol.Update(bean);
	}
}

package log.ministerio.services;

import java.util.List;

import log.ministerio.entidad.Bien;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.BienInterfaceDAO;


public class BienService {
	private DAOFactory fabrica = DAOFactory.getDAOFactory(1);
	private BienInterfaceDAO objBien=fabrica.getBienInterfaceDAO();
	
	public int RegistrarBien(Bien bean) {
		return objBien.Save(bean);
	}
	public int ActualizarBien(Bien bean) {
		return objBien.Update(bean);
	}
	public int EliminarBien(int codigo) {
		return objBien.Delete(codigo);
	}
	public Bien BuscarBienPorCodigo(int codBien){
		return objBien.findById(codBien);
	}
	public List<Bien> ListarBienes(){
		return objBien.listAll();
	}

}

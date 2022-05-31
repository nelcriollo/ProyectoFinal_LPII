package log.ministerio.services;

import java.util.List;

import log.ministerio.entidad.Menu;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.MenuInterfaceDAO;

public class MenuService {

	private DAOFactory fabrica = DAOFactory.getDAOFactory(1);
	private MenuInterfaceDAO objMenu=fabrica.getMenuInterfaceDAO();

	public int RegistrarMenu(Menu bean) {
		return objMenu.Save(bean);
	}
	public int ActualizarMenu(Menu bean) {
		return objMenu.Update(bean);
	}
	public int EliminarMenu(int codigo) {
		return objMenu.Delete(codigo);
	}
	public List<Menu> ListarMenus(){
		return objMenu.listAll();
	}
	public List<Menu> ListarOpcionesDelMenuPorUsuario(int codUsuario,int codMenu){
		return objMenu.ListarRolesDelMenusPorUsuario(codUsuario,codMenu);
	}

}

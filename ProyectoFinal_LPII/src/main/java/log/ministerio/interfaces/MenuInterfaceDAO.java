package log.ministerio.interfaces;

import java.util.List;

import log.ministerio.entidad.Menu;


public interface MenuInterfaceDAO {
	
	public int Save(Menu bean);
	public int Update(Menu bean);
	public int Delete(int cod);
	public Menu findById(int codmen);
	public List<Menu> listAll(int codMen);
	public List<Menu> ListarRolesDelMenusPorUsuario(int codUsu,int codMen);
}

package log.ministerio.services;

import java.util.List;
import log.ministerio.entidad.Usuario;
import log.ministerio.fabrica.DAOFactory;
import log.ministerio.interfaces.UsuarioInterfaceDAO;


public class UsuarioService {

	private DAOFactory fabrica = DAOFactory.getDAOFactory(1);
	private UsuarioInterfaceDAO objUsuario=fabrica.getUsuarioInterfaceDAO();

	public Usuario iniciarSession(String user,String password) {
		return objUsuario.inicioSession(user, password);
	}
	public int RegistrarUsuario(Usuario bean) {
		return objUsuario.Save(bean);
	}
	public int ActualizarUsuario(Usuario bean) {
		return objUsuario.Update(bean);
	}
	public int EliminarUsuario(int codigo) {
		return objUsuario.Delete(codigo);
	}
	public List<Usuario> ListarUsuarios(){
		return objUsuario.listAll();
	}

}

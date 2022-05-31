package log.ministerio.interfaces;

import java.util.List;

import log.ministerio.entidad.Usuario;

public interface UsuarioInterfaceDAO {
	
	public Usuario inicioSession(String login_usuario,String password_usuario);
	public int Save(Usuario bean);
	public int Update(Usuario bean);
	public int Delete(int cod);
	public Usuario findById(int codUser);
	public List<Usuario> listAll();
	
}


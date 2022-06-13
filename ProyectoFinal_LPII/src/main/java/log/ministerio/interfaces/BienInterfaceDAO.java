package log.ministerio.interfaces;

import java.util.List;

import log.ministerio.entidad.Bien;
import log.ministerio.entidad.Usuario;

public interface BienInterfaceDAO {
	
	public int Save(Bien bean);
	public int Update(Bien bean);
	public int Delete(int cod_bien);
	public Bien findById(int cod_bien);
	public List<Bien> listAll();

}

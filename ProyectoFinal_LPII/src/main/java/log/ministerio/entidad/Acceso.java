package log.ministerio.entidad;

public class Acceso {
	private int cod_acceso,cod_menu,cod_usuario,cod_Rol;
	private String des_menu,login_usuario,icono_menu,des_rol;

	public Acceso(int cod_menu, int cod_usuario, int cod_Rol, String des_menu, String login_usuario, String icono_menu,
			String des_rol) {
		this.cod_menu = cod_menu;
		this.cod_usuario = cod_usuario;
		this.cod_Rol = cod_Rol;
		this.des_menu = des_menu;
		this.login_usuario = login_usuario;
		this.icono_menu = icono_menu;
		this.des_rol = des_rol;
	}

	public Acceso() {
		// TODO Auto-generated constructor stub
	}

	public int getCod_menu() {
		return cod_menu;
	}

	public void setCod_menu(int cod_menu) {
		this.cod_menu = cod_menu;
	}

	public int getCod_usuario() {
		return cod_usuario;
	}

	public void setCod_usuario(int cod_usuario) {
		this.cod_usuario = cod_usuario;
	}

	public int getCod_Rol() {
		return cod_Rol;
	}

	public void setCod_Rol(int cod_Rol) {
		this.cod_Rol = cod_Rol;
	}

	public String getDes_menu() {
		return des_menu;
	}

	public void setDes_menu(String des_menu) {
		this.des_menu = des_menu;
	}

	public String getLogin_usuario() {
		return login_usuario;
	}

	public void setLogin_usuario(String login_usuario) {
		this.login_usuario = login_usuario;
	}

	public String getIcono_menu() {
		return icono_menu;
	}

	public void setIcono_menu(String icono_menu) {
		this.icono_menu = icono_menu;
	}

	public String getDes_rol() {
		return des_rol;
	}

	public void setDes_rol(String des_rol) {
		this.des_rol = des_rol;
	}

	public int getCod_acceso() {
		return cod_acceso;
	}

	public void setCod_acceso(int cod_acceso) {
		this.cod_acceso = cod_acceso;
	}

	


}

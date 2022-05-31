package log.ministerio.entidad;

public class Usuario {

	private int cod_usuario,cod_Empleado;
	private String nombre, apellido,login_usuario, password_usuario,estado_usuario;


	public Usuario(int cod_usuario, int cod_Empleado, String nombre, String apellido, String login_usuario,
			String password_usuario, String estado_usuario) {
		this.cod_usuario = cod_usuario;
		this.cod_Empleado = cod_Empleado;
		this.nombre = nombre;
		this.apellido = apellido;
		this.login_usuario = login_usuario;
		this.password_usuario = password_usuario;
		this.estado_usuario = estado_usuario;
	}



	public Usuario() {
		// TODO Auto-generated constructor stub
	}



	public int getCod_usuario() {
		return cod_usuario;
	}



	public void setCod_usuario(int cod_usuario) {
		this.cod_usuario = cod_usuario;
	}



	public int getCod_Empleado() {
		return cod_Empleado;
	}



	public void setCod_Empleado(int cod_Empleado) {
		this.cod_Empleado = cod_Empleado;
	}



	public String getNombre() {
		return nombre;
	}



	public void setNombre(String nombre) {
		this.nombre = nombre;
	}



	public String getApellido() {
		return apellido;
	}



	public void setApellido(String apellido) {
		this.apellido = apellido;
	}



	public String getLogin_usuario() {
		return login_usuario;
	}



	public void setLogin_usuario(String login_usuario) {
		this.login_usuario = login_usuario;
	}



	public String getPassword_usuario() {
		return password_usuario;
	}



	public void setPassword_usuario(String password_usuario) {
		this.password_usuario = password_usuario;
	}



	public String getEstado_usuario() {
		return estado_usuario;
	}



	public void setEstado_usuario(String estado_usuario) {
		this.estado_usuario = estado_usuario;
	}




}

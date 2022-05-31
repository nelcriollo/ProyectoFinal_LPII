package log.ministerio.entidad;

public class Menu {
	private int cod_rolmenu,cod_menu;
	private String des_menu,des_rolmenu,url_rolmenu;


	public Menu(int cod_rolmenu, int cod_menu, String des_menu, String des_rolmenu, String url_rolmenu) {
		this.cod_rolmenu = cod_rolmenu;
		this.cod_menu = cod_menu;
		this.des_menu = des_menu;
		this.des_rolmenu = des_rolmenu;
		this.url_rolmenu = url_rolmenu;
	}

	public Menu() {
		// TODO Auto-generated constructor stub
	}

	public int getCod_rolmenu() {
		return cod_rolmenu;
	}

	public void setCod_rolmenu(int cod_rolmenu) {
		this.cod_rolmenu = cod_rolmenu;
	}

	public int getCod_menu() {
		return cod_menu;
	}

	public void setCod_menu(int cod_menu) {
		this.cod_menu = cod_menu;
	}

	public String getDes_menu() {
		return des_menu;
	}

	public void setDes_menu(String des_menu) {
		this.des_menu = des_menu;
	}

	public String getDes_rolmenu() {
		return des_rolmenu;
	}

	public void setDes_rolmenu(String des_rolmenu) {
		this.des_rolmenu = des_rolmenu;
	}

	public String getUrl_rolmenu() {
		return url_rolmenu;
	}

	public void setUrl_rolmenu(String url_rolmenu) {
		this.url_rolmenu = url_rolmenu;
	}



}

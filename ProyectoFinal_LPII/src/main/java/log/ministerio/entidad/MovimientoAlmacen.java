package log.ministerio.entidad;

public class MovimientoAlmacen {
	
	private int id_codMovimiento, id_tipoMovimiento, cod_tipobien, cod_bien, cantidad;
	private String descripcion_del_bien;
	private String nombreMovimiento, nom_tipoBien, nombreBien;
	
	public int getId_codMovimiento() {
		return id_codMovimiento;
	}
	public void setId_codMovimiento(int id_codMovimiento) {
		this.id_codMovimiento = id_codMovimiento;
	}
	public int getId_tipoMovimiento() {
		return id_tipoMovimiento;
	}
	public void setId_tipoMovimiento(int id_tipoMovimiento) {
		this.id_tipoMovimiento = id_tipoMovimiento;
	}
	public int getCod_tipobien() {
		return cod_tipobien;
	}
	public void setCod_tipobien(int cod_tipobien) {
		this.cod_tipobien = cod_tipobien;
	}
	public int getCod_bien() {
		return cod_bien;
	}
	public void setCod_bien(int cod_bien) {
		this.cod_bien = cod_bien;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public String getDescripcion_del_bien() {
		return descripcion_del_bien;
	}
	public void setDescripcion_del_bien(String descripcion_del_bien) {
		this.descripcion_del_bien = descripcion_del_bien;
	}
	public String getNombreMovimiento() {
		return nombreMovimiento;
	}
	public void setNombreMovimiento(String nombreMovimiento) {
		this.nombreMovimiento = nombreMovimiento;
	}
	public String getNom_tipoBien() {
		return nom_tipoBien;
	}
	public void setNom_tipoBien(String nom_tipoBien) {
		this.nom_tipoBien = nom_tipoBien;
	}
	public String getNombreBien() {
		return nombreBien;
	}
	public void setNombreBien(String nombreBien) {
		this.nombreBien = nombreBien;
	}
		
}

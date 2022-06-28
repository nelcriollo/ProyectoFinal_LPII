package log.ministerio.entidad;

public class TipoMovimiento {
	
	private int id_TipoMovimiento;
	private String nombreMovimiento;
		
	public TipoMovimiento(int id_TipoMovimiento, String nombreMovimiento) {
		this.id_TipoMovimiento = id_TipoMovimiento;
		this.nombreMovimiento = nombreMovimiento;
	}
	
	public TipoMovimiento() {
	}
	
	public int getId_TipoMovimiento() {
		return id_TipoMovimiento;
	}
	public void setId_TipoMovimiento(int id_TipoMovimiento) {
		this.id_TipoMovimiento = id_TipoMovimiento;
	}
	public String getNombreMovimiento() {
		return nombreMovimiento;
	}
	public void setNombreMovimiento(String nombreMovimiento) {
		this.nombreMovimiento = nombreMovimiento;
	}	

}

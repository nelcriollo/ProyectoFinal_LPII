package log.ministerio.entidad;

public class DetalleOrdenCompra {
	private int iddetalleOC;
	private int idordencompra;
	private int idbienes;
	private int cantidad;
	private String descripcion;
	private double precioUnitario;
	private double valortotal;
	public DetalleOrdenCompra(int iddetalleOC, int idordencompra, int idbienes, int cantidad, String descripcion,
			double precioUnitario, double valortotal) {
		this.iddetalleOC = iddetalleOC;
		this.idordencompra = idordencompra;
		this.idbienes = idbienes;
		this.cantidad = cantidad;
		this.descripcion = descripcion;
		this.precioUnitario = precioUnitario;
		this.valortotal = valortotal;
	}
	public DetalleOrdenCompra() {
	}
	public int getIddetalleOC() {
		return iddetalleOC;
	}
	public void setIddetalleOC(int iddetalleOC) {
		this.iddetalleOC = iddetalleOC;
	}
	public int getIdordencompra() {
		return idordencompra;
	}
	public void setIdordencompra(int idordencompra) {
		this.idordencompra = idordencompra;
	}
	public int getIdbienes() {
		return idbienes;
	}
	public void setIdbienes(int idbienes) {
		this.idbienes = idbienes;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public double getPrecioUnitario() {
		return precioUnitario;
	}
	public void setPrecioUnitario(double precioUnitario) {
		this.precioUnitario = precioUnitario;
	}
	public double getValortotal() {
		return valortotal;
	}
	public void setValortotal(double valortotal) {
		this.valortotal = valortotal;
	}
	
	

}

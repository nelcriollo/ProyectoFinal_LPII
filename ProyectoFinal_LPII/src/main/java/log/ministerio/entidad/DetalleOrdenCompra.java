package log.ministerio.entidad;

public class DetalleOrdenCompra {
	private int idDetalleOC;
	private int idordencompra;
	private int idBien;
	private int cantidad;
	private String descripcion;
	private double precioUnitario;
	private double valortotal;
	
	private Bien bien;
	private OrdenCompra ordenCompra;

	
	
	public DetalleOrdenCompra(int idDetalleOC, int idordencompra, int idBien, int cantidad, String descripcion,
			double precioUnitario, double valortotal, Bien bien, OrdenCompra ordenCompra) {
		this.idDetalleOC = idDetalleOC;
		this.idordencompra = idordencompra;
		this.idBien = idBien;
		this.cantidad = cantidad;
		this.descripcion = descripcion;
		this.precioUnitario = precioUnitario;
		this.valortotal = valortotal;
		this.bien = bien;
		this.ordenCompra = ordenCompra;
	}

	public DetalleOrdenCompra() {
		super();
	}

	public int getIddetalleOC() {
		return idDetalleOC;
	}


	public void setIddetalleOC(int idDetalleOC) {
		this.idDetalleOC = idDetalleOC;
	}


	public int getIdordencompra() {
		return idordencompra;
	}


	public void setIdordencompra(int idordencompra) {
		this.idordencompra = idordencompra;
	}


	public int getIdbienes() {
		return idBien;
	}


	public void setIdbienes(int idBien) {
		this.idBien = idBien;
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


	public Bien getBien() {
		return bien;
	}


	public void setBien(Bien bien) {
		this.bien = bien;
	}


	public OrdenCompra getOrdenCompra() {
		return ordenCompra;
	}


	public void setOrdenCompra(OrdenCompra ordenCompra) {
		this.ordenCompra = ordenCompra;
	}

}

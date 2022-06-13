package log.ministerio.entidad;

public class OrdenCompra {
	private int idOrdencompra ;
	private String fechaOrdencompra;
	private String fechaEntrega ;
	private int idProveedor ;
	private String CondicionesPago ;
	private String Embalaje ;
	private String Transporte ;
	private double ValorTotalOrdenCompra;
	public OrdenCompra(int idOrdencompra, String fechaOrdencompra, String fechaEntrega, int idProveedor,
			String condicionesPago, String embalaje, String transporte, double valorTotalOrdenCompra) {
		this.idOrdencompra = idOrdencompra;
		this.fechaOrdencompra = fechaOrdencompra;
		this.fechaEntrega = fechaEntrega;
		this.idProveedor = idProveedor;
		CondicionesPago = condicionesPago;
		Embalaje = embalaje;
		Transporte = transporte;
		ValorTotalOrdenCompra = valorTotalOrdenCompra;
	}
	public OrdenCompra() {
	}
	public int getIdOrdencompra() {
		return idOrdencompra;
	}
	public void setIdOrdencompra(int idOrdencompra) {
		this.idOrdencompra = idOrdencompra;
	}
	public String getFechaOrdencompra() {
		return fechaOrdencompra;
	}
	public void setFechaOrdencompra(String fechaOrdencompra) {
		this.fechaOrdencompra = fechaOrdencompra;
	}
	public String getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	public int getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(int idProveedor) {
		this.idProveedor = idProveedor;
	}
	public String getCondicionesPago() {
		return CondicionesPago;
	}
	public void setCondicionesPago(String condicionesPago) {
		CondicionesPago = condicionesPago;
	}
	public String getEmbalaje() {
		return Embalaje;
	}
	public void setEmbalaje(String embalaje) {
		Embalaje = embalaje;
	}
	public String getTransporte() {
		return Transporte;
	}
	public void setTransporte(String transporte) {
		Transporte = transporte;
	}
	public double getValorTotalOrdenCompra() {
		return ValorTotalOrdenCompra;
	}
	public void setValorTotalOrdenCompra(double valorTotalOrdenCompra) {
		ValorTotalOrdenCompra = valorTotalOrdenCompra;
	}
	

}

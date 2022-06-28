package log.ministerio.interfaces;

import java.util.List;

import log.ministerio.entidad.MovimientoAlmacen;


public interface MovimientoAlmacenInterfaceDAO {
	
	
	public int  RegistrarMovimientoAlmacen(MovimientoAlmacen bean,int tipoMovimiento,int Cod_bien,int Cantidad);
	public int ActualizarMovimientoAlmacen(MovimientoAlmacen bean);
	public int EliminarMovimientoAlmacen(int idCodMov);
	public List<MovimientoAlmacen> listAll();
	public MovimientoAlmacen findById(int idCodMov);
}

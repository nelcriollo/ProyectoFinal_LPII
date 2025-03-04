package log.ministerio.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import log.ministerio.entidad.Bien;
import log.ministerio.entidad.DetalleDevolucion;
import log.ministerio.entidad.Devolucion;
import log.ministerio.entidad.OrdenCompra;
import log.ministerio.entidad.Proveedor;
import log.ministerio.interfaces.DetalleDevolucionInterfaceDAO;
import log.ministerio.utils.MySqlConexion;

public class MySqlDetalleDevolucion implements DetalleDevolucionInterfaceDAO {

	@Override
	public List<DetalleDevolucion> ListarDetalleDevolucionPorCodDevol(int codigo) {
		List<DetalleDevolucion> lista=new ArrayList<DetalleDevolucion>();
		DetalleDevolucion bean=null;
		Connection conex=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_DETALLE_DEVOLUCION_COD_DEVOLUCION(?)}"); 
			cstm.setInt(1,codigo);
			rs=cstm.executeQuery();

			while(rs.next()) {

				bean=new DetalleDevolucion();


				bean.setId_DetalleDevolucion(rs.getInt(1));
				Devolucion d  =new Devolucion(rs.getInt(2),rs.getString(3));
				bean.setDevolucion(d);
				OrdenCompra oc =new OrdenCompra(rs.getString(4));
				bean.setOrdenCompra(oc);
				Bien b = new Bien(rs.getString(5),rs.getInt(6),rs.getString(7));
				bean.setBien(b);
				bean.setDescripcion_del_dano(rs.getString(8));
				bean.setPrecioCompra(rs.getDouble(9));
				bean.setCantidad(rs.getInt(10));
				bean.setCredito_adeudado(rs.getDouble(11));


				lista.add(bean);
				
			} 
		}
		catch (Exception e) {
			System.out.println("Error en la Consulta..."+e.getMessage());
		}finally {
			try {
				if(cstm!=null || conex!=null)
					cstm.close();
				conex.close();
			} catch (SQLException ex) {
				System.out.println("No se pudo conectar a la BD "+ex.getMessage());
				ex.printStackTrace();
			}
		}

		return lista;
	}

	@Override
	public int Delete(int codigoDetalle, String nroDevolucion, double nuevoCreditoAdeudado) {
		int salida=-1; 
		Connection conex=null; 
		CallableStatement cstmDt=null,cstmDv=null; 
		try { 

			conex=MySqlConexion.getConectar();
			conex.setAutoCommit(false);
			cstmDt=conex.prepareCall("{call SP_ELIMINAR_DETALLE_DEVOLUCION(?)}"); 
			cstmDt.setInt(1, codigoDetalle); 

			salida=cstmDt.executeUpdate();

			cstmDv=conex.prepareCall("{call SP_ACTUALIZA_TOTAL_CREDITO_ADEUDADO_DEVOLUCION(?,?)}"); 
			cstmDv.setString(1, nroDevolucion); 
			cstmDv.setDouble(2, nuevoCreditoAdeudado); 

			salida=cstmDv.executeUpdate();

			conex.commit();

			
		} 
		catch (Exception e) {
			System.out.println("Error en la Eliminazación..."+e.getMessage());
			try {
				conex.rollback();
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
		}finally {
			try {
				if(cstmDv!=null || cstmDt!=null || conex!=null)
					cstmDv.close();
				cstmDt.close();
				conex.close();
			} catch (SQLException ex) {
				System.out.println("No se pudo conectar a la BD "+ex.getMessage());
				ex.printStackTrace();
			}
		}

		return salida;
	}

}

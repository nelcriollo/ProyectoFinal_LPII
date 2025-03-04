package log.ministerio.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import log.ministerio.entidad.MovimientoAlmacen;
import log.ministerio.interfaces.MovimientoAlmacenInterfaceDAO;
import log.ministerio.utils.MySqlConexion;

public class MySqlMovimientoAlmacenDAO implements MovimientoAlmacenInterfaceDAO {

	

	public int RegistrarMovimientoAlmacen(MovimientoAlmacen bean,int tipoMovimiento,int Cod_bien,int Cantidad) {
		int salida=-1;
		Connection cn=null;
		CallableStatement cstm=null,cstmst=null;
		try {
			cn=MySqlConexion.getConectar();
			cn.setAutoCommit(false);
			cstm=cn.prepareCall("{CALL SP_REGISTRAR_INGRESO_SALIDA_BIENES(?,?,?,?,?)}");
						
			cstm.setInt(1,bean.getId_codMovimiento());
			cstm.setInt(2, bean.getId_tipoMovimiento());
			cstm.setInt(3, bean.getCod_tipobien());
			cstm.setInt(4, bean.getCod_bien() );
			cstm.setInt(5, bean.getCantidad());
			
			salida=cstm.executeUpdate();
			
		
			/*ResultSet rs = cstm.getResultSet();
			int tipoMovimiento = 0,Cod_bien = 0,Cantidad = 0;
			while(rs.next()) {
		
				 tipoMovimiento=rs.getInt(2);
				 Cod_bien=rs.getInt(4);
				 Cantidad=rs.getInt(5);
			}*/
			
			cstmst=cn.prepareCall("{CALL SP_ACTUALIZAR_STOCK_BIEN(?,?,?)}");
			
			cstmst.setInt(1, tipoMovimiento);
			cstmst.setInt(2, Cod_bien);
			cstmst.setInt(3, Cantidad);
			
			salida=cstmst.executeUpdate();
			
			cn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				cn.rollback();
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
		}
		finally {
			try {
				if(cstmst !=null || cstm!=null || cn!=null) {
					cstmst.close();
					cstm.close();
				    cn.close();
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int ActualizarMovimientoAlmacen(MovimientoAlmacen bean) {
		int salida =-1;
		Connection cn=null;
		CallableStatement  cstm=null;

		try {
			cn=MySqlConexion.getConectar();
			cstm=cn.prepareCall("{CALL SP_ACTUALIZAR_INGRESO_SALIDA_BIENES(?,?,?,?,?)}");
			
			cstm.setInt(1,bean.getId_codMovimiento());
			cstm.setInt(2, bean.getId_tipoMovimiento());
			cstm.setInt(3, bean.getCod_tipobien());
			cstm.setInt(4, bean.getCod_bien() );
			cstm.setInt(5, bean.getCantidad());
	

			salida=cstm.executeUpdate();
			
			System.out.println("Se Actualizaron: "+salida+ " datos");

		} catch (Exception e) {
			System.out.println("Error en la Actualización..."+e.getMessage());
		}finally {
			try {
				if(cstm!=null || cn!=null)
					cstm.close();
				cn.close();
			} catch (SQLException ex) {
				System.out.println("No se pudo conectar a la BD "+ex.getMessage());
				ex.printStackTrace();
			}
		}

		return salida;
	}

	@Override
	public int EliminarMovimientoAlmacen(int idCodMov) {
		int salida=-1; 
		Connection cn=null; 
		CallableStatement cstm=null; 
		try { 

			cn=MySqlConexion.getConectar();
			cstm=cn.prepareCall("{call SP_ELIMINAR_INGRESO_SALIDA(?)}"); 
			cstm.setInt(1, idCodMov); 

			salida=cstm.executeUpdate();
			System.out.println("Se Eliminaron: "+salida+ " datos");
		} 
		catch (Exception e) {
			System.out.println("Error en la Eliminazación..."+e.getMessage());
		}finally {
			try {
				if(cstm!=null || cn!=null)
					cstm.close();
				cn.close();
			} catch (SQLException ex) {
				System.out.println("No se pudo conectar a la BD "+ex.getMessage());
				ex.printStackTrace();
			}
		}

		return salida;
	}

	@Override
	public List<MovimientoAlmacen> listAll() {
		List<MovimientoAlmacen> lista=new ArrayList<MovimientoAlmacen>();
		MovimientoAlmacen bean=null;
		Connection cn=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConectar();
			cstm=cn.prepareCall("{call SP_LISTAR_INGRESO_SALIDA_BIENES()}");
			rs=cstm.executeQuery();

			while(rs.next()) {
				
				bean=new MovimientoAlmacen();
				
				bean.setId_codMovimiento(rs.getInt(1));
				bean.setNombreMovimiento(rs.getString(2));
				bean.setNom_tipoBien(rs.getString(3));
				bean.setNombreBien(rs.getString(4));
				bean.setCantidad(rs.getInt(5));

				lista.add(bean);
				
				System.out.println("Se listaron: "+lista+ " datos");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(cstm!=null) cstm.close();
				if(cn!=null) cn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return lista;
	}

	@Override
	public MovimientoAlmacen findById(int idCodMov) {
		MovimientoAlmacen bean =null;
		Connection conex =null;
		CallableStatement  cstm=null;
		ResultSet rs =null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_EDITAR_MOVIMIENTO_ALMACEN(?)}"); 
			cstm.setInt(1, idCodMov); 

			rs=cstm.executeQuery();

			while (rs.next()) {

				bean=new MovimientoAlmacen();
				
				bean.setId_codMovimiento(rs.getInt(1));
				bean.setId_tipoMovimiento(rs.getInt(2));
				bean.setCod_tipobien(rs.getInt(3));
				bean.setCod_bien(rs.getInt(4));
				bean.setCantidad(rs.getInt(5));
				bean.setDescripcion_del_bien(rs.getString(6));	
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(conex != null)conex.close();
				if(cstm != null)cstm.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}


}

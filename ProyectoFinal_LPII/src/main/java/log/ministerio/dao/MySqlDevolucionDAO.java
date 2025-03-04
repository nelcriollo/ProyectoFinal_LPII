package log.ministerio.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import log.ministerio.entidad.DetalleDevolucion;
import log.ministerio.entidad.Devolucion;
import log.ministerio.entidad.Proveedor;
import log.ministerio.interfaces.DevolucionInterfaceDAO;
import log.ministerio.utils.MySqlConexion;


public class MySqlDevolucionDAO implements DevolucionInterfaceDAO {

	@Override
	public int save(Devolucion bean, List<DetalleDevolucion> lista) {
		int insert = -1;
		Connection conex=null;
		CallableStatement   cstmDetDevol=null;
		PreparedStatement cstmDevol =null;
		

		try {
			conex=MySqlConexion.getConectar();
			conex.setAutoCommit(false);
			
	
			String sqlProc= "INSERT INTO Devolucion VALUES (null,?,?,?,?,?)";
			cstmDevol=conex.prepareStatement(sqlProc,Statement.RETURN_GENERATED_KEYS);
			
			

			
			//cstmDevol.setInt(1,bean.getId_Devolucion());
			cstmDevol.setString(1,bean.getNro_ficha());
			cstmDevol.setDate(2, (Date) bean.getFecha());
			cstmDevol.setInt(3,bean.getId_proveedor());
			cstmDevol.setDouble(4,bean.getTotal_credito_adeudado());
			cstmDevol.setString(5,bean.getNomRemitente());

		   insert= cstmDevol.executeUpdate();
		 
				
			ResultSet rs =cstmDevol.getGeneratedKeys();
			rs.next();
			int clave=rs.getInt(1);
		
			for(DetalleDevolucion det: lista) {
				cstmDetDevol=conex.prepareCall("{CALL SP_REGISTRAR_DETALLE_DEVOLUCION(null,?,?,?,?,?,?,?)}");
				//cstmDetDevol.setInt(1,det.getId_DetalleDevolucion());
				cstmDetDevol.setInt(1,clave);
				cstmDetDevol.setString(2,det.getNro_orden_compra());
				cstmDetDevol.setInt(3, det.getId_Bien());
				cstmDetDevol.setString(4,det.getDescripcion_del_dano());
				cstmDetDevol.setDouble(5,det.getPrecioCompra());
				cstmDetDevol.setInt(6,det.getCantidad());
				cstmDetDevol.setDouble(7,det.getCredito_adeudado());
				
				insert=cstmDetDevol.executeUpdate();	
			}
			
			conex.commit();
			
			

		}
		catch (Exception e) {
			System.out.println("Error en la insert..."+ e.getMessage());
	
			try {
				conex.rollback();
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
			
		}finally {
			try {
				if(cstmDetDevol !=null || cstmDevol!=null || conex!=null) {
					cstmDetDevol.close();
					cstmDevol.close();
				    conex.close();
				}
			} catch (SQLException ex) {
				System.out.println("No se pudo conectar a la BD "+ex.getMessage());
				ex.printStackTrace();
			}
		}

		return insert;
	}

	@Override
	public List<Devolucion> listAll() {
		List<Devolucion> lista=new ArrayList<Devolucion>();
		Devolucion bean=null;
		Connection conex=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_DEVOLUCION()}"); 

			rs=cstm.executeQuery();

			while(rs.next()) {

				bean=new Devolucion();
				
				
				bean.setId_Devolucion(rs.getInt(1));
				bean.setNro_ficha(rs.getString(2));
				bean.setFecha((rs.getDate(3)));
				Proveedor p =new Proveedor(rs.getString(4));
				bean.setProveedor(p);
				bean.setTotal_credito_adeudado(rs.getDouble(5));
				bean.setNomRemitente(rs.getString(6));

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
	public String GenerarNuemroDevolucion() {
		Connection conex=null; 
		CallableStatement cstm=null; 
		String numeroDevol=""; 
		ResultSet rs=null;
		try { 
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_GENERAR_NUM_FICHA_DEVOLUCION()}"); 
			rs=cstm.executeQuery();
			if(rs.next()) {
				numeroDevol=rs.getString(1);
			}
			
		} catch (Exception e) 
		{ e.printStackTrace(); 
		} 

		return numeroDevol;
	}

	@Override
	public Devolucion ListarDevol_Por_Codigo(int codigo) {
		Devolucion bean =null;
		Connection conex =null;
		CallableStatement  cstm=null;
		ResultSet rs =null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_DEVOLUCION_COD(?)}"); 
			cstm.setInt(1, codigo); 

			rs=cstm.executeQuery();

			while (rs.next()) {

				bean=new Devolucion();
				
				bean.setId_Devolucion(rs.getInt(1));
				bean.setNro_ficha(rs.getString(2));
				bean.setFecha(rs.getDate(3));
				Proveedor p=new Proveedor(rs.getInt(4),rs.getString(5));
				bean.setProveedor(p);
				bean.setTotal_credito_adeudado(rs.getDouble(6));
				bean.setNomRemitente(rs.getString(7));
					
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

	@Override
	public int delete(int codigoDevol) {
		int salida=-1; 
		Connection conex=null; 
		CallableStatement cstm=null; 
		try { 

			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_ELIMINAR_DEVOLUCION(?)}"); 
			cstm.setInt(1, codigoDevol); 

			salida=cstm.executeUpdate();
			
		} 
		catch (Exception e) {
			System.out.println("Error en la Eliminazación..."+e.getMessage());
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

		return salida;
	}

	@Override
	public int Update(Devolucion bean) {
		int insert =-1;
		Connection conex=null;
		CallableStatement  cstm=null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{CALL SP_ACTUALIZAR_DEVOLUCION(?,?,?,?,?,?)}");
			
			cstm.setInt(1,bean.getId_Devolucion());
			cstm.setString(2,bean.getNro_ficha());
			cstm.setDate(3,(Date) bean.getFecha());
			cstm.setInt(4,bean.getId_proveedor());
			cstm.setDouble(5,bean.getTotal_credito_adeudado());
			cstm.setString(6,bean.getNomRemitente());

			insert=cstm.executeUpdate();
			

		} catch (Exception e) {
			System.out.println("Error en la actualización..."+e.getMessage());
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

		return insert;
	}
	

}

package log.ministerio.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import log.ministerio.entidad.Proveedor;
import log.ministerio.interfaces.ProveedorInterfaceDAO;
import log.ministerio.utils.MySqlConexion;

public class MySqlProveedorDAO implements ProveedorInterfaceDAO{

	@Override
	public int RegistrarProveedor(Proveedor bean) {
		int salida=-1;
		Connection cn=null;
		CallableStatement cstm=null;
		try {
			cn=MySqlConexion.getConectar();
			cstm=cn.prepareCall("{CALL SP_REGISTRAR_PROVEEDORES(?,?,?,?,?,?,?,?)}");
			cstm.setInt(1, bean.getId_proveedor());
			cstm.setString(2, bean.getRazon_social());
			cstm.setString(3, bean.getNombre_comercial());
			cstm.setString(4, bean.getNumero_ruc() );
			cstm.setString(5, bean.getEmail());
			cstm.setString(6, bean.getDireccion());
			cstm.setString(7, bean.getDepartamento());
			cstm.setString(8, bean.getTelefonos());
			
			salida=cstm.executeUpdate();
			
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(cstm!=null) cstm.close();
				if(cn!=null) cn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int ActualizarProveedor(Proveedor bean) {
		int salida =-1;
		Connection cn=null;
		CallableStatement  cstm=null;

		try {
			cn=MySqlConexion.getConectar();
			cstm=cn.prepareCall("{CALL SP_ACTUALIZAR_PROVEEDORES(?,?,?,?,?,?,?,?)}");
			
			cstm.setInt(1,bean.getId_proveedor());			
			cstm.setString(2,bean.getRazon_social());
			cstm.setString(3,bean.getNombre_comercial());
			cstm.setString(4,bean.getNumero_ruc());
			cstm.setString(5,bean.getEmail());
			cstm.setString(6,bean.getDireccion());
			cstm.setString(7,bean.getDepartamento());
			cstm.setString(8,bean.getTelefonos());

			salida=cstm.executeUpdate();
			
			

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
	public int EliminarProveedor(int idProd) {
		int salida=-1; 
		Connection cn=null; 
		CallableStatement cstm=null; 
		try { 

			cn=MySqlConexion.getConectar();
			cstm=cn.prepareCall("{call SP_ELIMINAR_PROVEEDORES(?)}"); 
			cstm.setInt(1, idProd); 

			salida=cstm.executeUpdate();
			
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
	public List<Proveedor> listAll() {
		List<Proveedor> lista=new ArrayList<Proveedor>();
		Proveedor bean=null;
		Connection cn=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConectar();
			cstm=cn.prepareCall("{call SP_LISTAR_PROVEEDORES()}");
			rs=cstm.executeQuery();

			while(rs.next()) {
				
				bean=new Proveedor();
				
				bean.setId_proveedor(rs.getInt(1));
				bean.setRazon_social(rs.getString(2));
				bean.setNombre_comercial(rs.getString(3));
				bean.setNumero_ruc(rs.getString(4));
				bean.setEmail(rs.getString(5));
				bean.setDireccion(rs.getString(6));
				bean.setDepartamento(rs.getString(7));
				bean.setTelefonos(rs.getString(8));

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

}

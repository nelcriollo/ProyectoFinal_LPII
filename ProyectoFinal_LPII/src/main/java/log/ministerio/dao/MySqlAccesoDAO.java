package log.ministerio.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import log.ministerio.entidad.Acceso;
import log.ministerio.entidad.Menu;
import log.ministerio.interfaces.AccesoInterfaceDAO;
import log.ministerio.utils.MySqlConexion;

public class MySqlAccesoDAO implements AccesoInterfaceDAO {

	@Override
	public int Save(Acceso bean) {
		int insert =-1;
		Connection conex=null;
		CallableStatement  cstm=null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{CALL SP_REGISTRAR_ACCESO(?,?,?,?)}");
			
			cstm.setInt(1,bean.getCod_acceso());
			cstm.setInt(2,bean.getCod_menu());
			cstm.setInt(3,bean.getCod_usuario());
			cstm.setInt(4,bean.getCod_Rol());

			insert=cstm.executeUpdate();
			

		} catch (Exception e) {
			System.out.println("Error en la insert..."+e.getMessage());
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

	@Override
	public int Update(Acceso bean) {
		int salida =-1;
		Connection conex=null;
		CallableStatement  cstm=null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{CALL SP_ACTUALIZAR_ACCESO(?,?,?,?)}");

			cstm.setInt(1,bean.getCod_acceso());
			cstm.setInt(2,bean.getCod_menu());
			cstm.setInt(3,bean.getCod_usuario());
			cstm.setInt(4,bean.getCod_Rol());


			salida=cstm.executeUpdate();
			

		} catch (Exception e) {
			System.out.println("Error en la insert..."+e.getMessage());
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
	public int Delete(int cod) {
		int salida=-1; 
		Connection conex=null; 
		CallableStatement cstm=null; 
		try { 

			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_ELIMINAR_ACCESO(?)}"); 
			cstm.setInt(1, cod); 

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
	public List<Acceso> listAll() {
		List<Acceso> lista=new ArrayList<Acceso>();
		Acceso bean=null;
		Connection conex=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_ACCESOS()}"); 

			rs=cstm.executeQuery();

			while(rs.next()) {

				bean=new Acceso();
				bean.setCod_acceso(rs.getInt(1));
				bean.setDes_menu(rs.getString(2));
				bean.setLogin_usuario(rs.getString(3));
				bean.setDes_rol(rs.getString(4));

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
	public Acceso findById(int cod) {
		Acceso bean =null;
		Connection conex =null;
		CallableStatement  cstm=null;
		ResultSet rs =null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_EDITAR_ACCESO(?)}"); 
			cstm.setInt(1, cod); 

			rs=cstm.executeQuery();

			while (rs.next()) {

				bean=new Acceso();
				
				bean.setCod_acceso(rs.getInt(1));
				bean.setCod_usuario(rs.getInt(2));
				bean.setLogin_usuario(rs.getString(3));
				bean.setCod_menu(rs.getInt(4));
				bean.setDes_menu(rs.getString(5));
				bean.setCod_Rol(rs.getInt(6));
				bean.setDes_rol(rs.getString(7));	
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
	public List<Acceso> ListarMenu_PorUsuario(int codUsu) {
		List<Acceso> lista=new ArrayList<Acceso>();
		Acceso bean =null;
		Connection conex =null;
		CallableStatement  cstm=null;
		ResultSet rs =null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_MENU_POR_USUARIO(?)}"); 
			cstm.setInt(1, codUsu); 

			rs=cstm.executeQuery();

			while (rs.next()) {

				bean=new Acceso();

				bean.setCod_menu(rs.getInt(1));
				bean.setDes_menu(rs.getString(2));
				bean.setIcono_menu(rs.getString(3));

				lista.add(bean);
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
		return lista;
	}

	@Override
	public List<Acceso> listAllModulos() {
		List<Acceso> lista=new ArrayList<Acceso>();
		Acceso bean=null;
		Connection conex=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_MENUS()}"); 

			rs=cstm.executeQuery();

			while(rs.next()) {

				bean=new Acceso();

				bean.setCod_menu(rs.getInt(1));
				bean.setDes_menu(rs.getString(2));
				bean.setIcono_menu(rs.getString(3));



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
	public ResultSet GenerarIdAcceso() {
		
		Connection conex=null; 
		CallableStatement cstm=null; 
		ResultSet rs=null; 
		try { 
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_GENERAR_CODIGO_ACCESO()}"); 
			rs=cstm.executeQuery(); 
			
		} catch (Exception e) 
		{ e.printStackTrace(); 
		} 

		return rs;
	}

}

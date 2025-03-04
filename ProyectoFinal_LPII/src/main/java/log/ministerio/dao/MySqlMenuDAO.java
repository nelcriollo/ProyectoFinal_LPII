package log.ministerio.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import log.ministerio.entidad.Menu;
import log.ministerio.entidad.Usuario;
import log.ministerio.interfaces.MenuInterfaceDAO;
import log.ministerio.utils.MySqlConexion;

public class MySqlMenuDAO implements MenuInterfaceDAO {

	@Override
	public int Save(Menu bean) {
		int insert =-1;
		Connection conex=null;
		CallableStatement  cstm=null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{CALL SP_REGISTRAR_ROL_USUARIO_MENU(?,?,?,?)}");

			cstm.setInt(1,bean.getCod_rolmenu());
			cstm.setString(2,bean.getDes_rolmenu());
			cstm.setString(3,bean.getUrl_rolmenu());
			cstm.setInt(4,bean.getCod_menu());

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
	public int Update(Menu bean) {
		int salida =-1;
		Connection conex=null;
		CallableStatement  cstm=null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{CALL SP_ACTUALIZAR_ROL_USUARIO_MENU(?,?,?,?)}");

			cstm.setInt(1,bean.getCod_rolmenu());
			cstm.setString(2,bean.getDes_rolmenu());
			cstm.setString(3,bean.getUrl_rolmenu());
			cstm.setInt(4,bean.getCod_menu());

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
			cstm=conex.prepareCall("{call SP_ELIMINAR_ROL_USUARIO_MENU(?)}"); 
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
	public Menu findById(int codmen) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Menu> listAll(int codMen) {
		List<Menu> lista=new ArrayList<Menu>();
		Menu bean=null;
		Connection conex=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_ROLES(?)}");
			cstm.setInt(1, codMen); 
			
			rs=cstm.executeQuery();

			while(rs.next()) {

				bean=new Menu();

				bean.setCod_rolmenu(rs.getInt(1));
				bean.setDes_rolmenu(rs.getString(2));
				bean.setUrl_rolmenu(rs.getString(3));
				bean.setCod_menu(rs.getInt(4));


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
	public List<Menu> ListarRolesDelMenusPorUsuario(int codUsu, int codMen) {
		List<Menu> lista=new ArrayList<Menu>();
		Menu bean =null;
		Connection conex =null;
		CallableStatement  cstm=null;
		ResultSet rs =null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_ROLES_POR_USUARIO(?,?)}"); 
			cstm.setInt(1, codUsu);
			cstm.setInt(2, codMen);

			rs=cstm.executeQuery();

			while (rs.next()) {

				bean=new Menu();
				
				bean.setCod_menu(rs.getInt(1));
				bean.setDes_menu(rs.getString(2));
				bean.setCod_rolmenu(rs.getInt(3));
				bean.setDes_rolmenu(rs.getString(4));
				bean.setUrl_rolmenu(rs.getString(5));
				

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
}

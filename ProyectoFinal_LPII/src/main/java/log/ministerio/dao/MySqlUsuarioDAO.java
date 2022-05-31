package log.ministerio.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import log.ministerio.entidad.Usuario;
import log.ministerio.interfaces.UsuarioInterfaceDAO;
import log.ministerio.utils.MySqlConexion;

public class MySqlUsuarioDAO implements UsuarioInterfaceDAO {

	@Override
	public Usuario inicioSession(String login_usuario, String password_usuario) {
		Usuario bean=null;
		Connection conex=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_INICIAR_SESSION(?,?)}"); 
			cstm.setString(1, login_usuario);
			cstm.setString(2, password_usuario);

			rs=cstm.executeQuery();

			if(rs.next()) {

				bean=new Usuario();

				bean.setCod_usuario(rs.getInt(1));
				bean.setLogin_usuario(rs.getString(2));
				bean.setNombre(rs.getString(3));
				bean.setApellido(rs.getString(4));
			} 
		}
		catch (Exception e) {
			System.out.println("Error en el login..."+e.getMessage());
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

		return bean;
	}

	@Override
	public int Save(Usuario bean) {
		int insert =-1;
		Connection conex=null;
		CallableStatement  cstm=null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{CALL SP_REGISTRAR_USUARIO(?,?,?,?,?)}");

			cstm.setInt(1,bean.getCod_usuario());
			cstm.setString(2,bean.getLogin_usuario());
			cstm.setString(3,bean.getPassword_usuario());
			cstm.setInt(4,bean.getCod_Empleado());
			cstm.setString(5,bean.getEstado_usuario());

			insert=cstm.executeUpdate();
			System.out.println("Se insertaron: "+insert+ " datos");

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
	public int Update(Usuario bean) {
		int salida =-1;
		Connection conex=null;
		CallableStatement  cstm=null;

		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{CALL SP_ACTUALIZAR_USUARIO(?,?,?,?,?)}");

			cstm.setInt(1,bean.getCod_usuario());
			cstm.setString(2,bean.getLogin_usuario());
			cstm.setString(3,bean.getPassword_usuario());
			cstm.setInt(4,bean.getCod_Empleado());
			cstm.setString(5,bean.getEstado_usuario());

			salida=cstm.executeUpdate();
			System.out.println("Se Actualizaron: "+salida+ " datos");

		} catch (Exception e) {
			System.out.println("Error en la Actualización..."+e.getMessage());
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
			cstm=conex.prepareCall("{call SP_ELIMINAR_USUARIO(?)}"); 
			cstm.setInt(1, cod); 

			salida=cstm.executeUpdate();
			System.out.println("Se Eliminaron: "+salida+ " datos");
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
	public Usuario findById(int codUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Usuario> listAll() {
		List<Usuario> lista=new ArrayList<Usuario>();
		Usuario bean=null;
		Connection conex=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_USUARIOS()}"); 

			rs=cstm.executeQuery();

			while(rs.next()) {

				bean=new Usuario();

				bean.setCod_usuario(rs.getInt(1));
				bean.setLogin_usuario(rs.getString(2));
				bean.setPassword_usuario(rs.getString(3));
				bean.setCod_Empleado(rs.getInt(4));
				bean.setEstado_usuario(rs.getString(5));

				lista.add(bean);
				System.out.println("Se listaron: "+lista+ " datos");
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

}

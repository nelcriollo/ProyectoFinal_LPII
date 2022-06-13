package log.ministerio.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import log.ministerio.entidad.TipoBien;
import log.ministerio.interfaces.TipoBienInterfaceDAO;
import log.ministerio.utils.MySqlConexion;

public class MySqlTipoBienDAO implements TipoBienInterfaceDAO {

	@Override
	public List<TipoBien> listAll() {
		List<TipoBien> lista=new ArrayList<TipoBien>();
		TipoBien bean=null;
		Connection conex=null;
		CallableStatement  cstm=null;
		ResultSet rs=null;
		try {
			conex=MySqlConexion.getConectar();
			cstm=conex.prepareCall("{call SP_LISTAR_TIPOBIEN()}"); 

			rs=cstm.executeQuery();

			while(rs.next()) {

				bean=new TipoBien();
				bean.setCod_tipobien(rs.getInt(1));
				bean.setNom_tipoBien(rs.getString(2));

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

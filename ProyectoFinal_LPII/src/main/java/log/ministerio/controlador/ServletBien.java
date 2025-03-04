package log.ministerio.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import log.ministerio.entidad.Acceso;
import log.ministerio.entidad.Bien;
import log.ministerio.services.BienService;


@WebServlet("/ServletBien")
public class ServletBien extends HttpServlet {
	private static final long serialVersionUID = 1L;


	private BienService servicioBien= new BienService();

	public ServletBien() {
		super();


	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String accion;
		accion=request.getParameter("tipo");
		if(accion.equals("LISTAR")) 
			listarBienes(request,response);
		else if(accion.equals("REGISTRAR")) 
			registrarBien(request,response);
		else if(accion.equals("ELIMINAR")) 
			eliminarBien(request,response);
	}


	private void registrarBien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codbien,tipobien,nombien,desbien,cant,estado,identificador;

		codbien=request.getParameter("codbien");
		tipobien=request.getParameter("tipobien");
		nombien=request.getParameter("nombien");
		desbien=request.getParameter("desbien");
		cant=request.getParameter("cant");
		estado=request.getParameter("estado");
		identificador=request.getParameter("tipoOperacion");

		Bien bean=new Bien();



		bean.setTipo_bien(Integer.parseInt(tipobien));
		bean.setNombre(nombien);
		bean.setDescripcion(desbien);
		bean.setStock(Integer.parseInt(cant));
		bean.setEstado(estado);


		int tipo = Integer.parseInt(identificador);
		int salida;

		if(tipo==0) {

			salida=servicioBien.RegistrarBien(bean);

			if(salida>0) {


				request.setAttribute("MENSAJE", "Bien registrado correctamente");
				listarBienes(request, response);
			}
			else {
				request.setAttribute("MENSAJE", "Error en el registro de Bien");
				listarBienes(request, response);

			}

		}else if (tipo==1) {
			bean.setCod_bien(Integer.parseInt(codbien));
			salida=servicioBien.ActualizarBien(bean);

			if(salida>0) {


				request.setAttribute("MENSAJE", "Bien Actualizado correctamente");
				listarBienes(request, response);
			}
			else {
				request.setAttribute("MENSAJE", "Error al actualizar de Bien");
				listarBienes(request, response);

			}

		}


	}

	private void listarBienes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Bien> data=servicioBien.ListarBienes();

		request.setAttribute("listaBienes", data);

		request.getRequestDispatcher("/Mantenimiento_Bien.jsp").forward(request, response);

	}

	private void eliminarBien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo;

		codigo=request.getParameter("codigoEliminar");

		int salida;
		salida=servicioBien.EliminarBien(Integer.parseInt(codigo));

		if(salida>0) {

			request.setAttribute("MENSAJE", "Bien eliminado correctamente");
			listarBienes(request, response);
		}
		else {
			request.setAttribute("MENSAJE", "Error en la eliminación del Bien");
			listarBienes(request, response);

		}


	}

}

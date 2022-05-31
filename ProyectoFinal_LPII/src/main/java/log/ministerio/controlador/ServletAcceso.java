package log.ministerio.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import log.ministerio.entidad.Acceso;
import log.ministerio.services.AccesoService;


@WebServlet("/ServletAcceso")
public class ServletAcceso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AccesoService servicioAcceso = new AccesoService();

	public ServletAcceso() {
		super();

	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String accion;
		accion=request.getParameter("tipo");
		if(accion.equals("LISTAR")) 
			listarAccesos(request,response);
		else if(accion.equals("REGISTRAR")) 
			registrarAcceso(request,response);
		else if(accion.equals("ACTUALIZAR")) 
			actualizarAcceso(request,response);
		else if(accion.equals("ELIMINAR")) 
			eliminarAcceso(request,response);
	}


	private void eliminarAcceso(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}


	private void actualizarAcceso(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}


	private void registrarAcceso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				String codUser,codmenu,codRol;
			
				codmenu=request.getParameter("codMenu");
				codUser=request.getParameter("codUser");
				codRol=request.getParameter("codOpcionMemu");
			
				Acceso bean=new Acceso();
				
				bean.setCod_menu(Integer.parseInt(codmenu));
				bean.setCod_usuario(Integer.parseInt(codUser));
				bean.setCod_Rol(Integer.parseInt(codRol));
				

					int salida;
					salida=servicioAcceso.RegistrarAcceso(bean);
					
					if(salida>0) {
				
						
						request.setAttribute("MENSAJE", "Acceso registrado correctamente");
						listarAccesos(request, response);
					}
					else {
						request.setAttribute("MENSAJE", "Error en el registro de Acceso");
						listarAccesos(request, response);

					}

	}


	private void listarAccesos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Acceso> data=servicioAcceso.ListarAccesos();

		request.setAttribute("listaAccesos", data);

		request.getRequestDispatcher("/acceso.jsp").forward(request, response);

	}

}

package log.ministerio.controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import log.ministerio.entidad.Acceso;
import log.ministerio.entidad.Menu;
import log.ministerio.entidad.Usuario;
import log.ministerio.services.AccesoService;
import log.ministerio.services.MenuService;
import log.ministerio.services.UsuarioService;



@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioService servicioUser = new UsuarioService();
	private MenuService servicioMenu = new MenuService();
	private AccesoService servicioAcceso = new AccesoService();


	public ServletUsuario() {
		super();

	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion;
		accion=request.getParameter("tipo");
		if(accion.equals("INICIAR")) 
			iniciarSessionDelUsuario(request,response);
		else if(accion.equals("CERRAR")) 
			cerrarSessionDelUsuario(request,response);
	}


	private void cerrarSessionDelUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recuperar la session actual
		HttpSession session=request.getSession();
		//invalidad la session "destruir todos los atributos de tipo session con el m�todo invalidate()"
		session.invalidate();
	
		request.setAttribute("MENSAJE", "Sesi�n Finalizada.");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		

	}


	private void iniciarSessionDelUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String loginUser,passwordUsuer,codigoMenu;
		loginUser=request.getParameter("usuario");
		passwordUsuer=request.getParameter("clave");

		Usuario bean = servicioUser.iniciarSession(loginUser, passwordUsuer);


		if(bean==null) {
			request.setAttribute("MENSAJE", "Usuario y/o Clave incorrectos");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		else {

			List<Acceso> Menus=servicioAcceso.ListarMenusPor_Usuario(bean.getCod_usuario());
			List<Menu> OpcionesMenu= new ArrayList<Menu>();

			for (int i = 0; i < Menus.size(); i++) {
				//almacenamos  las opciones del menu del usuario, seg�n el codigo de usuario y el c�digo del menu
				List<Menu> rolesmenu=servicioMenu.ListarOpcionesDelMenuPorUsuario(bean.getCod_usuario(),Menus.get(i).getCod_menu());

				//adicionamos las opciones del menu al la lista
				OpcionesMenu.addAll(rolesmenu);
			}

			HttpSession session=request.getSession();

			session.setAttribute("usuario", bean);
			session.setAttribute("LISTAMenu", Menus);
			session.setAttribute("LISTAOpciones", OpcionesMenu);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		

		}
	}

}

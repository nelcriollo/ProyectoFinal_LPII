package log.ministerio.controlador;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import log.ministerio.entidad.Menu;
import log.ministerio.services.MenuService;


@WebServlet("/ServletRolMenuJSON")
public class ServletRolMenuJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
    public ServletRolMenuJSON() {
        super();
        
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String codmenu=request.getParameter("rolesmenu");
		
		List<Menu>  lista = new MenuService().ListarRolesMenu(Integer.parseInt(codmenu));
			
				Gson Gson=new Gson();
				
				String json=Gson.toJson(lista);
				
				response.setContentType("application/json;charset=UTF-8");
				
				PrintWriter salida=response.getWriter();
				salida.println(json);
	}

}

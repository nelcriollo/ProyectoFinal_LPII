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

import log.ministerio.entidad.DetalleDevolucion;
import log.ministerio.services.DeatalleDevolucionService;




@WebServlet("/ServletDeatalleDevolucionJSON")
public class ServletDeatalleDevolucionJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ServletDeatalleDevolucionJSON() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod=request.getParameter("codDevol");
		  List<DetalleDevolucion> lista= new DeatalleDevolucionService().listarDetalleDevolucion_Por_codigo_Devolucion(Integer.parseInt(cod));
			
			Gson gson=new Gson();
			
			String json=gson.toJson(lista);
			
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter salida=response.getWriter();
			salida.println(json);	
	}

}

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


import log.ministerio.entidad.DetalleOrdenCompra;
import log.ministerio.services.DetalleOrdenCompraService;


@WebServlet("/Servlet_OC_DetalleOC_JSON")
public class Servlet_OC_DetalleOC_JSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Servlet_OC_DetalleOC_JSON() {
        super();
       
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     List<DetalleOrdenCompra> lista= new DetalleOrdenCompraService().ListarOrdenCompra_con_DetalleOC();
		
		Gson gson=new Gson();
		
		String json=gson.toJson(lista);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);	
	}

}

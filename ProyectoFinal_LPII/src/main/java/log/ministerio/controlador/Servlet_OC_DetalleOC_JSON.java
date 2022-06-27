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

<<<<<<<< HEAD:.metadata/.plugins/org.eclipse.core.resources/.history/9e/c009310e89ed001c14fcb78248750dd8
import log.ministerio.entidad.Bien;
import log.ministerio.services.BienService;

/**
 * Servlet implementation class ServletBienesJSON
 */
@WebServlet("/ServletBienesJSON")
public class ServletBienesJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BienService servicioBien= new BienService();
	
    public ServletBienesJSON() {
========

import log.ministerio.entidad.DetalleOrdenCompra;
import log.ministerio.services.DetalleOrdenCompraService;


@WebServlet("/Servlet_OC_DetalleOC_JSON")
public class Servlet_OC_DetalleOC_JSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Servlet_OC_DetalleOC_JSON() {
>>>>>>>> NelsonCriollo:ProyectoFinal_LPII/src/main/java/log/ministerio/controlador/Servlet_OC_DetalleOC_JSON.java
        super();
       
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<<< HEAD:.metadata/.plugins/org.eclipse.core.resources/.history/9e/c009310e89ed001c14fcb78248750dd8

		List<Bien> data=servicioBien.ListarBienes();
========
     List<DetalleOrdenCompra> lista= new DetalleOrdenCompraService().ListarOrdenCompra_con_DetalleOC();
>>>>>>>> NelsonCriollo:ProyectoFinal_LPII/src/main/java/log/ministerio/controlador/Servlet_OC_DetalleOC_JSON.java
		
		Gson gson=new Gson();
		
		String json=gson.toJson(lista);
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);	
	}

}

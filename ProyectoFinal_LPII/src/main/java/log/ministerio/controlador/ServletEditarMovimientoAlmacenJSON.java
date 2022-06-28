package log.ministerio.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import log.ministerio.entidad.MovimientoAlmacen;
import log.ministerio.services.MovimientoAlmacenService;

@WebServlet("/ServletEditarMovimientoAlmacenJSON")
public class ServletEditarMovimientoAlmacenJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletEditarMovimientoAlmacenJSON() {
        super();
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idCodMov=request.getParameter("codigoMov");	

		MovimientoAlmacen  objAcceso = new MovimientoAlmacenService().buscarCodigoMovimiento(Integer.parseInt(idCodMov));
		Gson Gson=new Gson();
		String json=Gson.toJson(objAcceso);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
	}


}

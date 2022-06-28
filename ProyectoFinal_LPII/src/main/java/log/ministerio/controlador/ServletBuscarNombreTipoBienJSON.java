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

import log.ministerio.services.TipoBienService;
import log.ministerio.entidad.TipoBien;


@WebServlet("/ServletBuscarNombreBienJSON")
public class ServletBuscarNombreTipoBienJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletBuscarNombreTipoBienJSON() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codBien=request.getParameter("codigoBien");
		List<TipoBien> lista=new TipoBienService().BuscarCodigo(Integer.parseInt(codBien));
		Gson gson=new Gson();
		String json=gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);	
	}
}

package log.ministerio.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import log.ministerio.entidad.MovimientoAlmacen;
import log.ministerio.services.MovimientoAlmacenService;

/**
 * Servlet implementation class ServletMovimientoAlmacen
 */
@WebServlet("/ServletMovimientoAlmacen")
public class ServletMovimientoAlmacen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// Declarar objeto de la clase MovimientoAlmacenService
	private MovimientoAlmacenService servicio;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMovimientoAlmacen() {    	
        super();
        // Crear objeto
        servicio=new MovimientoAlmacenService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion;
		accion=request.getParameter("tipo");
		
		if(accion.equals("LISTAR")) {
			listarMovimientoAlmacen(request,response);
		}
		else if(accion.equals("REGISTRAR")) {
			registrarMovimientoAlmacen(request,response);
		}
		else if(accion.equals("ELIMINAR")) {
			eliminarMovimientoAlmacen(request,response);
		}
	}
	
	private void eliminarMovimientoAlmacen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idCodMov;
		idCodMov=request.getParameter("codigoEliminar");

		int salida;
		salida=servicio.eliminarPorId(Integer.parseInt(idCodMov));

		if(salida>0) {
			request.setAttribute("MENSAJE", "Movimiento eliminado correctamente");
			listarMovimientoAlmacen(request, response);
		}
		else {
			request.setAttribute("MENSAJE", "Error en la eliminación");
			listarMovimientoAlmacen(request, response);
		}
		
	}
	
	private void listarMovimientoAlmacen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<MovimientoAlmacen> data=servicio.listarTodos();
		
		request.setAttribute("listaMovimientoAlmacen", data);
		request.getRequestDispatcher("/InventarioBienes.jsp").forward(request, response);
	}
	
	private void registrarMovimientoAlmacen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String identificador,codMov,idTipoMov,idTipoBien,codBienes,cantidad,descripcion;
		
		identificador=request.getParameter("tipoOperacion");
		codMov=request.getParameter("miCodMovimiento");
		idTipoMov=request.getParameter("miTipoMovimiento");
		idTipoBien=request.getParameter("miTipoBien");
		codBienes=request.getParameter("miBien");
		cantidad=request.getParameter("miCantidad");
	

		MovimientoAlmacen bean=new MovimientoAlmacen();		
		
		bean.setId_codMovimiento(Integer.parseInt(codMov));
		bean.setId_tipoMovimiento(Integer.parseInt(idTipoMov));
		bean.setCod_tipobien(Integer.parseInt(idTipoBien));
		bean.setCod_bien(Integer.parseInt(codBienes));
		bean.setCantidad(Integer.parseInt(cantidad));
		
		
		int tipo = Integer.parseInt(identificador);
		int salida;
		
		if (tipo == 0) {
			
			salida=servicio.registrar(bean,Integer.parseInt(idTipoMov),Integer.parseInt(codBienes),Integer.parseInt(cantidad));

			if(salida>0) {
				request.setAttribute("MENSAJE", "Movimiento registrado correctamente");
				listarMovimientoAlmacen(request, response);
			}
			else {
				request.setAttribute("MENSAJE", "Error en el registro");
				listarMovimientoAlmacen(request, response);
			}
						
		}
		else if (tipo == 1) {
			
			bean.setId_codMovimiento(Integer.parseInt(codMov));
			
			salida=servicio.actualizar(bean);			

			if(salida>0) {
				request.setAttribute("MENSAJE", "Movimiento actualizado correctamente");
				listarMovimientoAlmacen(request, response);
			}
			else {
				request.setAttribute("MENSAJE", "Error en la actualización");
				listarMovimientoAlmacen(request, response);
			}			
		}
	
	}


}

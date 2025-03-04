package log.ministerio.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import log.ministerio.entidad.Bien;
import log.ministerio.entidad.DetalleDevolucion;
import log.ministerio.entidad.Devolucion;
import log.ministerio.services.DeatalleDevolucionService;
import log.ministerio.services.DetalleOrdenCompraService;
import log.ministerio.services.DevolucionService;


@WebServlet("/ServletDevolucionBien")
public class ServletDevolucionBien extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DevolucionService DevolServicio=new DevolucionService();
	private DeatalleDevolucionService DetalleDevolServicio=new DeatalleDevolucionService();

	public ServletDevolucionBien() {
		super();

	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String tipo=request.getParameter("tipo");

		if(tipo.equals("ADICIONAR"))
			adicionarBien(request,response);
		else if(tipo.equals("ELIMINAR"))
			eliminarBien(request,response);
		else if(tipo.equals("REGISTRAR"))
			grabarDevolucion(request,response);
		else if(tipo.equals("LISTAR"))
			listarDevoluciones(request,response);
		else if(tipo.equals("GENERARNUM"))
			generarNumeroFichaDevolucion(request,response);
		else if(tipo.equals("ELIMINARDEVOLUCION"))
			eliminarDevlucion(request,response);
		else if(tipo.equals("ELIMINARDETALLEDEVOL"))
			eliminarDetalleDevolucion(request,response);
	}

	private void eliminarDetalleDevolucion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String  codDetalleDevol,numeroFichaDevol,nuevoTotalCreditoAdeudo;
		
        codDetalleDevol=request.getParameter("codDetalleDevol");
        numeroFichaDevol=request.getParameter("numeroFichaDevol");
        nuevoTotalCreditoAdeudo=request.getParameter("nuevoTotalCreditoAdeudo");
		
		
		int salida;
		salida=DetalleDevolServicio.EliminarDetalleDevolucion_ActualizarMontoAdeudadoDevolucion(Integer.parseInt(codDetalleDevol),numeroFichaDevol,Double.parseDouble(nuevoTotalCreditoAdeudo));

		if(salida>0) {

			request.setAttribute("MENSAJE", "Detalle eliminado correctamente");
			listarDevoluciones(request, response);
		}
		else {
			request.setAttribute("MENSAJE", "Error en la eliminación,  del Detalle.");
			listarDevoluciones(request, response);

		}
		
	}


	private void eliminarDevlucion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  numeroDevolucion;
		
		numeroDevolucion=request.getParameter("codigoEliminar");
		
		
		int salida;
		salida=DevolServicio.EmininarDevolucion(Integer.parseInt(numeroDevolucion));

		if(salida>0) {
			
		
			request.setAttribute("MENSAJE", "Devolución eliminada correctamente");
			listarDevoluciones(request, response);
		}
		else {
			request.setAttribute("MENSAJE", "Error en la eliminación, la Devolución contiene Detalle.");
			listarDevoluciones(request, response);

		}
		
	}


	private void generarNumeroFichaDevolucion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String  numeroFicha =DevolServicio.NumeroFichaDevolucion();
		Gson gson=new Gson();

		String json=gson.toJson(numeroFicha);

		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);	
	}


	private void listarDevoluciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Devolucion> data=DevolServicio.listarDevoluciones();

		request.setAttribute("listaDevoluciones", data);

		request.getRequestDispatcher("/Mantenimiento_Devolucion_de_Bienes.jsp").forward(request, response);

	}


	private void grabarDevolucion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String codDevol,numerodevol,fech,remitente,proveedor,totalCreditoAdeudo,identificador;

		numerodevol=request.getParameter("numerodevol");
		fech=request.getParameter("fech");
		proveedor=request.getParameter("proveedor");
		totalCreditoAdeudo=request.getParameter("totalCreditoAdeudo");
		remitente=request.getParameter("remitente");
		codDevol=request.getParameter("codigodevol");
		identificador=request.getParameter("tipoOperacion");

		Devolucion bean = new Devolucion();

		bean.setNro_ficha(numerodevol);
		bean.setFecha(Date.valueOf(fech));
		bean.setId_proveedor(Integer.parseInt(proveedor));
		bean.setTotal_credito_adeudado(Double.parseDouble(totalCreditoAdeudo));
		bean.setNomRemitente(remitente);

		List<DetalleDevolucion> listaDetalle=(List<DetalleDevolucion>) request.getSession().getAttribute("DATA");

		int salida;
		int tipo = Integer.parseInt(identificador);
		if (tipo==0) {
		salida=DevolServicio.RegistrarDevolucion(bean, listaDetalle);

		if(salida>0) {
			
			listaDetalle.clear();
			request.setAttribute("MENSAJE", "Devolución registrado correctamente");
			//request.getRequestDispatcher("/Mantenimiento_Devolucion_de_Bienes.jsp").forward(request, response);
			listarDevoluciones(request,response);
		}
		else {
			request.setAttribute("MENSAJE", "Error en el registro de la Devolución");
			//request.getRequestDispatcher("/Mantenimiento_Devolucion_de_Bienes.jsp").forward(request, response);
			listarDevoluciones(request,response);

		}
	}else if (tipo==1) {
		bean.setId_Devolucion(Integer.parseInt(codDevol));
		salida=DevolServicio.ActualizarDevolucion(bean);

		if(salida>0) {


			request.setAttribute("MENSAJE", "Devolución Actualizada correctamente");
			//request.getRequestDispatcher("/Mantenimiento_Devolucion_de_Bienes.jsp").forward(request, response);
			listarDevoluciones(request,response);
		}
		else {
			request.setAttribute("MENSAJE", "Error en la actualizar  la Devolución");
			//request.getRequestDispatcher("/Mantenimiento_Devolucion_de_Bienes.jsp").forward(request, response);
			listarDevoluciones(request,response);
		}

	}

	}

	private void eliminarBien(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String codBien;

		codBien=request.getParameter("codigoBien");

		List<DetalleDevolucion> listaDetalle=(List<DetalleDevolucion>) request.getSession().getAttribute("DATA");
		for(DetalleDevolucion dt:listaDetalle) {
			if(dt.getId_Bien()==Integer.parseInt(codBien)) {
				listaDetalle.remove(dt);
				break;
			}
		}
		request.getSession().setAttribute("DATA", listaDetalle);

		Gson gson=new Gson();

		String json=gson.toJson(listaDetalle);

		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);

	}

	private void adicionarBien(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//leer parámetros
		String nroOC,codBien,desBien,desDano,cant,prec,creditoAdeu;

		nroOC=request.getParameter("nroOC");
		codBien=request.getParameter("codigoBien");
		desBien=request.getParameter("desBien");
		desDano=request.getParameter("descripcionDano");
		prec=request.getParameter("precio");
		cant=request.getParameter("cantidad");
		creditoAdeu=request.getParameter("creditoAdeudado");


		//declarar arreglo de objetos de la clase Detalle
		List<DetalleDevolucion> lista=null;
		//validar si existe el atributo DATA de tipo sesión
		if(request.getSession().getAttribute("DATA")==null) {//no existe el atributo DATA
			//crear arreglo lista
			lista=new ArrayList<DetalleDevolucion>();
		}
		else {//si existe el atributo DATA
			//recuperar el atributo "DATA" y guardarlo en el arreglo lista
			lista=(List<DetalleDevolucion>) request.getSession().getAttribute("DATA");
		}

		//crear objeto de la clase Detalle
		DetalleDevolucion det=new DetalleDevolucion();
		//setear atributos del objeto det usando las variables

		det.setNro_orden_compra(nroOC);
		det.setId_Bien(Integer.parseInt(codBien));
		det.setDescripcion_del_dano(desDano);
		det.setDesBien(desBien);
		det.setPrecioCompra(Double.parseDouble(prec));
		det.setCantidad(Integer.parseInt(cant));
		det.setCredito_adeudado(Double.parseDouble(creditoAdeu));

		//adicionar objeto det dentro del arreglo lista
		lista.add(det);
		//crear atributo de tipo sesión "DATA"  y guardar el arreglo lista
		request.getSession().setAttribute("DATA", lista);
		//crear JSON de lista
		//PASO 2: crear objeto de la clase Gson
		Gson gson=new Gson();
		//PASO 3: generar json del arreglo "lista" en formato String
		String json=gson.toJson(lista);
		//PASO 4: mostrar el valor de la variable "json" en formato JSON verdadero
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);	

	}

}

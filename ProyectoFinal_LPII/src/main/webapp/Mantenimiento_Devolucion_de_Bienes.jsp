<%
if (request.getSession().getAttribute("LISTAMenu") == null)
	response.sendRedirect("login.jsp");
%>

<jsp:include page="header.jsp"/>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mantenimiento Devolucion</title>

<!--  jquery-->
<link rel="stylesheet"
	href=" https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css"
	rel="stylesheet">

<style type="text/css">

.help-block {
    color: red;
}
.form-group.has-error .form-control-label {
	color: red;
}

.form-group.has-error .form-control {
	border: 1px solid red;
	box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
}
</style>


</head>
<body>

<c:if test="${requestScope.MENSAJE!=null}">
		<div class="toast bg-black mx-auto mt-2" role="alert"
			aria-live="assertive" aria-atomic="true" data-bs-delay="3000">
			<div class="toast-header">

				<button type="button" class="btn-close" data-bs-dismiss="toast"
					aria-label="Close"></button>
			</div>
			<div class="toast-body text-light">${requestScope.MENSAJE}</div>
		</div>

	</c:if>
	
<div class="container">


<div class="mt-5 p-5 bg-light">
<button type="button" class="btn btn-dark btn-generaFichaDevol" data-bs-toggle="modal" data-bs-target="#exampleModal">Genera Ficha de Devoluci�n</button>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen modificarTamano">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Mantenimiento de Devoluci�n</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
   <form id="IdRegistrarDevol" method="post" action="ServletDevolucionBien?tipo=REGISTRAR"  class="form-horizontal border mt-1 mb-3">
	<div class="row mx-3 my-1">
			 <input type="hidden" class="form-control" id="idIdentificador" name="tipoOperacion" value="0">
					<div class="row mx-3 my-3">
				<div class="col-md-6 text-center p-2 lh-sm">
					<br>
					<h5 class="fw-bolder">RUC:20401381291</h5>
					<p>Av Abancay cuadra. 5 S/N, Lima,Per�</p>
					<p>Telf: 990990215 - 989435229</p>
				</div>

				<div class="col-md-3 text-center p-3 lh-sm border border-secondary">
					
					<h6 class="col-form-label fw-bolder">Ficha de Devoluci�n</h6>
					<div class="row">
						<div class="mb-2 row g-2 d-flex justify-content-center mr-3">
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label fw-bolder">NRO:</label>
							</div>
							<div class="col-auto">
								<input type="text" id="idnumerodevol" name="numerodevol"
									class="form-control text-primary fw-bold text-center"
									aria-describedby="passwordHelpInline" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
			</div>

		<div class="col-md-2"></div>
	</div>
	

	<div class="row px-3">
			<div class="row p-3 border ms-0">
			<h5 class="text-info">Datos de Cabecera</h5>
	
			
			
<div class="col-ms-12 col-lg-9">
							<div class="row my-1 divCodigoDevolOculto" >
								<label for="txtcodDevolucion" class=" col-6 col-form-label">C�digo de Devoluci�n</label>
								<div class="col-6">
								<input type="text" class="form-control text-success fw-bolder" name="codigodevol"
								id="idcodigodevol" readonly="readonly">
								</div>
							</div>
							
	<div class="row"> 
		<div class="col-lg-5 col-md-6 col-sm-12 form-group quitar " id="tipob">
	  <label for="txtFechaDevolucion" class=" col-6 col-form-label">Fecha de Devoluci�n</label>
	   <input type="date" id="idFechaDevolucion" name="fech" class="form-control">
	  </div>
	  
	  <div class="col-lg-5 col-md-6 col-sm-12">
	    <label for="mpDepartamento" class="col-6 col-form-label">Remitente</label>
	 <input type="text" id="idRemitente" name="remitente" class="form-control" value="${sessionScope.usuario.nombre} ${sessionScope.usuario.apellido}" readonly="readonly">							
	  </div>
	  </div>
	  <div class="row mb-5"> 
	  <div class="col-lg-5 col-md-6 col-sm-12 form-group quitar">
	   <label for="txtProveedor" class=" col-6 col-form-label">Proveedor</label>
	   <select id="idProveedor" name="proveedor" class="form-select form-control">
	    <option value="" selected>--Seleccionar--</option>
	  </select>
	  </div>
	  <div class="col-lg-5 col-md-6 col-sm-12">
	<label for="mpDepartamento" class="col-6 col-form-label">Total cr�dito adeudado</label>
	  <input type="text" id="idtotalCreditoAdeudo" name="totalCreditoAdeudo" class="form-control text-danger fw-bold" value="0" readonly="readonly">
							
	  </div>
    </div>
  </div>
  </div>


</div>

<div class="row p-3  mb-3">
	<div class="col-lg-6 col-ms-12 p-3  mb-3 border cambiarTamano ">
		<h5 class="text-success">Datos del Detalle</h5>
	   <div class="col-md-12 form-group quitar">
	    <label for="validationDefault02" class="form-label">Cantidad</label>
	    <input type="text" class="form-control cal-creditoAdeudado" id="idcantidad" name="cantidad" value="">
	  </div>
	    <div class="col-md-12">
	    <label for="validationDefaultUsername" class="form-label">Descrpci�n del Da�o</label>
		    <div class="form-floating form-group quitar">
			  <textarea class="form-control" placeholder="" id="idDescripDano" name="descripcionDano" style="height: 100px"></textarea>
			  <label for="floatingTextarea2">Descrpci�n del Da�o</label>
			</div>
	  </div>
  
	  	<div class="row mt-1">	
				<div class="col-lg-12 col-sm-12 mt-4 table-responsive modificarTamanoTabla">
				<table id="tableDetalle" class="table table-striped table-sm" style="width: 100%; font-size: 12px">
							<thead class="table-dark">
					<tr class="table-success">
					    <th >NRO_OC</th>
						<th >CODIGO</th>
						<th >DES-BIEN</th>
						<th >CANT</th>
						<th >PRECIO</th>
						<th >CREDITO</th>
						<th >DES-DA�O</th>
						<th ></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
				</table>
			</div>
			
	     </div>
     

</div>

	<div class="col-lg-6 col-sm-12 p-3  mb-3 tablaBiensOcultar">
			<div class="col-lg-12 col-sm-12 mt-4 table-responsive">
			<table id="tableBienes" class="table table-striped table-sm" style="width: 100%; font-size: 12px">
			<thead class="table-dark">
				<tr >
					<th >NRO_OC</th>
					<th >PROVEE</th>
					<th >CODIGO</th>
					<th >DESCRPCION</th>
					<th >CANT-COMP</th>
					<th >PRE-COMP</th>
					<th ></th>
			
				</tr>
			</thead>
					<tbody>
					</tbody>
				</table>
			</div>
	</div>
		
</div>


						<div class="col-md-12 text-center mt-4 mb-5"> 										
								<button type="submit" id="Guardar" class="btn btn-primary me-2 btn-registrar"><i class="fas fa-save"></i> Registrar</button>
								<button type="button" id="Cancelar" class="btn btn-danger ms-2 cancelar" data-dismiss="modal"><i class="fas fa-undo-alt"></i> Cancelar</button>
						</div> 

		</form>
      </div>
      		
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


	


	
	<div class="col col-sm-12 mt-4 table-responsive">
			<table id="tbexample" class="table table-striped" style="width: 100%; font-size: 12px">
						<thead class="table-dark">
				<tr class="table-success">
				   <th>CODIGO</th>
					<th>NRO FICHA</th>
					<th>FECHA</th>
					<th>PROVEEDOR</th>
					<th>TOTAL</th>
					<th>REMITENTE</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				
					<c:forEach items="${requestScope.listaDevoluciones}" var="row">
								<tr>
									<td>${row.id_Devolucion}</td>
									<td class="text-primary">${row.nro_ficha}</td>
									<td class="text-info">${row.fecha}</td>
									<td>${row.proveedor.razon_social}</td>
									<td class="text-danger">${row.total_credito_adeudado}</td>
									<td>${row.nomRemitente}</td>
									
					<td><button type="button" class="btn btn-outline-dark btn-editar p-1 text-center" data-bs-toggle="modal" data-bs-target="#exampleModal">
					<i class="fas fa-edit"></i></button></td>
					<td><button type="button" class="btn btn-outline-success btn-verDetalle p-1 text-center" data-bs-toggle="modal" data-bs-target="#modalVerDetalleDevolucion" >
					<i class="fas fa-binoculars"></i></button></td>
					<td><button type="button" class="btn btn-outline-danger btn-eliminar-Devolucion p-1 text-center" data-bs-toggle="modal" data-bs-target="#modalElimimar">
					<i class="fas fa-backspace"></i></button></td>
						
						</tr>
					</c:forEach>
					
			</tbody>
		</table>
	</div>
	
	

	
		<!-- Modal  para ver detalle de devoluci�n-->
		
<div class="modal fade" id="modalVerDetalleDevolucion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Detalle  de Devoluci�n</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	
      	<div class="row mx-3 my-1">
			
					<div class="row mx-3 my-3">
				<div class="col-md-6 text-center p-2 lh-sm">
					<br>
					<h7 class="fw-bolder">RUC:20401381291</h7><br>
					<p>Av Abancay cuadra. 5 S/N, Lima,Per�</p>
					<p>Telf: 990990215 - 989435229</p>
				</div>
				<div class="col-md-3 text-center p-2 lh-sm border">
				
					<h6>Ficha de Devoluci�n</h6>
					<div class="row">
						<div class="mb-2 row g-2 d-flex justify-content-center mr-3">
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label fw-bolder">NRO:</label>
							</div>
							<div class="col-auto">
								<input type="text" id="idnumeroFichadevol" name="numerodevol"
									class="form-control text-primary fw-bold text-center"
									aria-describedby="passwordHelpInline" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
			</div>

		<div class="col-md-2"></div>
	</div>
	
      
   		<div class="row mt-1">	
	   		<h5 class="text-success">Datos del Detalle</h5>
	   				<div class="col-md-6 col-12">
							<div class="row my-1">
								<label for="mpDepartamento" class="col-6 col-form-label">Total
									cr�dito adeudado</label>
								<div class="col-6">
									<input type="text" id="idtotalCreditoAdeudonuevo" name="totalCreditoAdeudonuevo" class="form-control text-danger fw-bold" value="0" readonly="readonly">
								</div>

							</div>

						</div>

					<div class="col-lg-12 col-sm-12 mt-4 table-responsive">
					<table id="tableDetalleDevolucion" class="table table-striped table-sm" style="width: 100%; font-size: 12px">
								<thead class="table-dark">
						<tr class="table-success">
						    
							<th >CODIGO_DET</th>
							<th >CODIGO_DEV</th>
							<th >NRO_DEV</th>
							<th >NRO_OC</th>
							<th >TIPO_BIEN</th>
							<th >COD_BIEN</th>
							<th >DES_BIEN</th>
							<th >DES_DA�O</th>
							<th >PRECIO</th>
							<th >CANT</th>
							<th >CREDITO</th>
							<th ></th>
							<th ></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					</table>
				</div>
			
	     </div>

		
</div>				

      		
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    </div>
  </div>
  </div>
</div>


			
					
		  	
	
	<!-- Modal para Eliminar Devolucion-->
					<div class="modal fade" id="modalElimimar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h7 class="modal-title" id="exampleModalLabel">Sistema</h7>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        	<form id="idEliminar" method="post"
							action="ServletDevolucionBien?tipo=ELIMINARDEVOLUCION">
							<input type="hidden" class="form-control" name="codigoEliminar"
								id="codigoEliminar">
							<h6>�Seguro de eliminar?</h6>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">SI</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">NO</button>
							</div>
						</form>
					      </div>
					    </div>
					  </div>
					</div>
					
			<!-- Modal para Eliminar Detalle de Devolucion-->
					<div class="modal fade" id="modalElimimarDetalleDevol" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h7 class="modal-title" id="exampleModalLabel">Sistema</h7>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        	<form id="idEliminarDetalleDevol" method="post"
							action="ServletDevolucionBien?tipo=ELIMINARDETALLEDEVOL">
							<input type="hidden" class="form-control" name="codDetalleDevol"
								id="codDetalleDevol">
								<input type="hidden" class="form-control" name="numeroFichaDevol"
								id="numeroFichaDevol">
								<input type="hidden" class="form-control" name="nuevoTotalCreditoAdeudo"
								id="nuevoTotalCreditoAdeudo">
							<h6>�Seguro de eliminar?</h6>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">SI</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">NO</button>
							</div>
						</form>
					      </div>
					    </div>
					  </div>
					</div>
						
		
		
</div>
<br>
<br>

<jsp:include page="footer.jsp"/>

<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="jquery.dynamicTable.js"></script>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>


	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

	<!-- JS para validaci�n-->
	<script
		src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>
		
		
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
		
			
		<script>
		
		cargarBines();
		llenarcboProveedor();
		//cargarNumeroFichaDevol();
		
		 //fuciones para obtener el n�emro de ficha de devoluci�n
		$(document).on("click",".btn-generaFichaDevol",function(){
			
			$.get("ServletDevolucionBien?tipo=GENERARNUM",function(response){
					$("#idnumerodevol").val(response);
					
					$("#idIdentificador").val(0); //pasamos el valor de uno como indicadorpara actualizar
					 $('.tablaBiensOcultar').show(); //mostrar
					$('.modificarTamano'). removeClass('modal-xl');
					 $('.modificarTamano').addClass('modal-fullscreen');
					 $('.cambiarTamano').removeClass('col-lg-12 m-auto');
					 $('.cambiarTamano').addClass('col-lg-6 col-ms-12 p-3  mb-3');
					 $('.cambiarTamano').show();  
					 $('.divCodigoDevolOculto').hide(); //ocultar
					 
				
					 $('.btn-registrar').text("Registrar"); // para cambiar el texto del boton registrar
					 $('.btn-registrar').prop('disabled', false);// para habilitar el  boton registrar
				
			})
		})

		
		function cargarBines(){
		
			$.get("Servlet_OC_DetalleOC_JSON",function(response){
				$("#tableBienes tbody").empty();
				$.each(response,function(index,item){
					$("#tableBienes").append("<tr><td>"+item.ordenCompra.nroOrdencompra+"</td><td>"+item.ordenCompra.nomProveedor+"</td><td>"+
							item.bien.cod_bien+"</td><td>"+item.bien.descripcion+"</td><td>"+item.cantidad+"</td><td>"+item.precioUnitario+"</td><td>"+
							"<button type='button' class='btn btn-outline-success btn-adicionar me-1  p-1 text-center'><i class=' text-write fas fa-plus-circle'></i></button></td></tr>");
				})
				$('#tableBienes').DataTable();
				
			})
			
			
		}
		
		 //fuciones para llenar los select
		 function llenarcboProveedor(){
			$.get("ServletProveedorJSON",function(response){
				$.each(response,function(index,item){
					$("#idProveedor").append("<option value='"+item.id_proveedor+"'>"+item.razon_social+"</option>");
				})
			})
		}
		 

		//asignar evento click a todos los botones con clase "btn-adicionar"
		$(document).on("click",".btn-adicionar",function(){
			let nroOC,cod,desBien,cant,prec,creditoAdeu,suma=0;
			
			nroOC=$(this).parents("tr").find("td")[0].innerHTML;
			cod=$(this).parents("tr").find("td")[2].innerHTML;
			desBien=$(this).parents("tr").find("td")[3].innerHTML;
			prec=$(this).parents("tr").find("td")[5].innerHTML;
			desDano=$("#idDescripDano").val();
			cant=$("#idcantidad").val();
			creditoAdeu=(prec*cant);
			$.get("ServletDevolucionBien?tipo=ADICIONAR",{"nroOC":nroOC,"codigoBien":cod,"desBien":desBien,"descripcionDano":desDano,"precio":prec,"cantidad":cant,"creditoAdeudado":creditoAdeu},function(response){
				$("#tableDetalle tbody").empty();
				$.each(response,function(index,item){
					$("#tableDetalle").append("<tr><td>"+item.nro_orden_compra+"</td><td>"+item.id_Bien+"</td><td>"+item.desBien+"</td><td>"+item.precioCompra+"</td><td>"+
							item.cantidad+"</td><td>"+item.credito_adeudado+"</td><td>"+item.descripcion_del_dano+"</td><td>"+
						"<button type='button' class='btn btn-outline-danger btn-eliminar p-1 text-center'><i class='fas fa-backspace'></i></button></td></tr>");
					
					suma += parseFloat(item.credito_adeudado);
				})
				 
				console.log(suma);
				$("#idtotalCreditoAdeudo").val(suma);
				
			})
			
			
		})
		
		
		//asignar evento click a todos los botones con clase "btn-eliminar"
		$(document).on("click",".btn-eliminar",function(){
			let cod,suma=0;
			
			
			cod=$(this).parents("tr").find("td")[1].innerHTML;
			
			$.get("ServletDevolucionBien?tipo=ELIMINAR",{"codigoBien":cod},function(response){
				$("#tableDetalle tbody").empty();
				$.each(response,function(index,item){
					$("#tableDetalle").append("<tr><td>"+item.nro_orden_compra+"</td><td>"+item.id_Bien+"</td><td>"+item.desBien+"</td><td>"+item.precioCompra+"</td><td>"+
							item.cantidad+"</td><td>"+item.credito_adeudado+"</td><td>"+item.descripcion_del_dano+"</td><td>"+
						"<button type='button' class='btn btn-outline-danger btn-eliminar p-1 text-center'><i class='fas fa-backspace'></i></button></td></tr>");
					
					suma += parseFloat(item.credito_adeudado);
				})
				 
				
				$("#idtotalCreditoAdeudo").val(suma);
				
			})
			
			
		})
		
		
	</script>	
		
		<script>
		 $(document).on("click", ".btn-registrar", function() {
				
				if( $('.btn-registrar').text()=="Registrar"){
				if( $("#idFechaDevolucion").val()=="" || $("#idProveedor").val()==""||$("#idcantidad").val()=="" ||$("#idDescripDano").val()==""){    
					
					$('.quitar').addClass('form-group');
					 $('.quitar').addClass('has-error ');
					 $('.quitar').addClass('form-control-label');
					 $('small').show('help-block');
				}
				}else{
					 $('.quitar').removeClass('form-group');
					 $('.quitar').removeClass('has-error ');
					 $('.quitar').removeClass('form-control-label');
					 $('small').hide('help-block');
				
				}
			})
			
				 $(document).on("click", ".cancelar", function() {
				
				 $("#idFechaDevolucion").val("");
				 $("#idProveedor").val("");
				 $("#idcantidad").val("");
				 $("#idDescripDano").val();
					 $('.quitar').removeClass('form-group');
					 $('.quitar').removeClass('has-error ');
					 $('.quitar').removeClass('form-control-label');
					 $('small').hide('help-block');
					 $('.btn-registrar').prop('disabled', false);
				
				
			})
		
		
		//asignamos evento a todos los botones("editar") con nombre de clase "btn-editar"
		$(document).on("click", ".btn-editar", function() {
			
			
			 $("#idIdentificador").val(1); //pasamos el valor de uno como indicadorpara actualizar
			 $('.tablaBiensOcultar').hide(); //ocultar
			 $('.cambiarTamano').hide(); 
			 $('.divCodigoDevolOculto').show(); //mostrar
			 
			
			 $('.modificarTamano').removeClass('modal-fullscreen');
			 $('.modificarTamano').addClass('modal-xl');
			 $('.cambiarTamano').addClass('col-lg-12 m-auto');
		
		
			 $('.btn-registrar').text("Actualizar"); // para cambiar el texto del boton registrar
			 //$('.btn-registrar').prop('disabled', false);// para habilitar el  boton registrar
		     $("#idDescripDano").val("");
		     $("#codigodevol").val("");
			 
			let codigo;
			 //obtenemos el valor de la columna(0), para paserle como parametro al ServletAccesoJSON
			codigo = $(this).parents("tr").find("td")[0].innerHTML;
			 
			
			$.get("ServletDevolucionBienJSON",{"codigo":codigo},function(response){
				console.log(response);
				//$("#idBien").val(response.cod_bien);
				$("#idcodigodevol").val(response.id_Devolucion);
				$("#idnumerodevol").val(response.nro_ficha);
				$('#idFechaDevolucion').val(formatearFechaYMD(response.fecha));
				$("#idRemitente").val(response.nomRemitente);
				$("#idProveedor").val(response.proveedor.id_proveedor);
				$("#idtotalCreditoAdeudo").val(response.total_credito_adeudado);
				
			})
			
			//cargar el detalle de la devolucion editada
			$.get("ServletDeatalleDevolucionJSON",{"codDevol":codigo},function(response){
				 console.log(response);
				$("#tableDetalle tbody").empty();
				$.each(response,function(index,item){
					$("#tableDetalle").append("<tr><td name='tdNumOc'>"+item.ordenCompra.nroOrdencompra+"</td><td name='tdCodBien'>"+item.bien.cod_bien+"</td><td name='tdDesBien'>"+item.bien.descripcion+"</td><td name='tdPrecCompra'>"+item.precioCompra+
							"</td><td name='tdCantidad'>"+item.cantidad+"</td><td name='tdCredito'>"+item.credito_adeudado+"</td><td name='tdDesDano'>"+item.descripcion_del_dano+"</td><td>"+
						"<button type='button' class='btn btn-outline-danger btn-eliminar p-1 text-center'><i class='fas fa-backspace'></i></button></td></tr>");
							
				})
				
				
			})
		})
			
		
					
						
		//asignar evento click a todos los botones con clase "btn-verDetalle"
		$(document).on("click",".btn-verDetalle",function(){
			let codigo,numficha,suma=0;
			
			
			codigo=$(this).parents("tr").find("td")[0].innerHTML;
			numficha=$(this).parents("tr").find("td")[1].innerHTML;
			$("#idnumeroFichadevol").val(numficha);
			
			$.get("ServletDeatalleDevolucionJSON",{"codDevol":codigo},function(response){
				 console.log(response);
				$("#tableDetalleDevolucion tbody").empty();
				$.each(response,function(index,item){
					$("#tableDetalleDevolucion").append("<tr><td>"+item.id_DetalleDevolucion+"</td><td>"+item.devolucion.id_Devolucion+"</td><td>"+item.devolucion.nro_ficha+"</td><td>"+item.ordenCompra.nroOrdencompra+"</td><td>"+
							item.bien.nombreTipo+"</td><td>"+item.bien.cod_bien+"</td><td>"+item.bien.descripcion+"</td><td>"+item.descripcion_del_dano+"</td><td>"+item.precioCompra+"</td><td>"+item.cantidad+"</td><td>"+item.credito_adeudado+"</td><td>"+
						"<button type='button' class='btn btn-outline-danger btn-eliminarDetalle p-1 text-center' data-bs-toggle='modal' data-bs-target='#modalElimimarDetalleDevol'><i class='fas fa-backspace'></i></button></td></tr>");
					
					suma += parseFloat(item.credito_adeudado);
				})
				$("#idtotalCreditoAdeudonuevo").val(suma);
				
				
				
			})
			
		})
		
		//funcion para eliminar por c�digo
		$(document).on("click", ".btn-outline-danger", function() {
			//variable
			let codigo;
			//obtener el c�digo del Acceso seg�n el bot�n eliminar que se a pulsado
			codigo = $(this).parents("tr").find("td")[0].innerHTML;
			//asignar a la caja con id "codigoEliminar" el valor de la variable "codigo"
			$("#codigoEliminar").val(codigo);
			
			//$.get("ServletDevolucionBien?tipo=LISTAR",function(response){
				//$("#idnumerodevol").val(response);
			
		//})

		})
		
		
			//funcion para eliminar Detalle de devoluci�n por c�digo
		$(document).on("click", ".btn-eliminarDetalle", function() {
			//variable
			let codigoDetalle,nroFichaDevol,nuevoTotalCredito;
			//obtener el c�digo del Acceso seg�n el bot�n eliminar que se a pulsado
			codigo = $(this).parents("tr").find("td")[0].innerHTML;
			nroFichaDevol=$('#idnumeroFichadevol').val();
			nuevoTotalCredito=$('#idtotalCreditoAdeudonuevo').val();
			
			//asignar a la caja con id "codigoEliminar" el valor de la variable "codigo"
			$("#codDetalleDevol").val(codigo);
			$("#numeroFichaDevol").val(nroFichaDevol);
			$("#nuevoTotalCreditoAdeudo").val(nuevoTotalCredito);
			
			//$.get("ServletDevolucionBien?tipo=LISTAR",function(response){
				//$("#idnumerodevol").val(response);
			
		//})

		})
		
		
		
	function formatearFechaYMD(fech){
			var Vfecha = new Date(fech);
			
			var VDia=Vfecha.getDate();
			var VMes=Vfecha.getMonth()+1;
			var VYear=Vfecha.getFullYear();
			
			VDia=VDia<10? "0"+VDia: VDia;
			VMes=VMes<10? "0"+VMes: VMes;
			
			return  VYear+"-"+VMes+"-"+VDia;
			console.log(VYear+"-"+VMes+"-"+VDia);
		}
		
			
		
		</script>
		
		<script type="text/javascript">
		$(document).ready(function() {
			$('#IdRegistrarDevol').bootstrapValidator(
								{
									
												fields : {
													
													fech : {
														validators : {
															notEmpty: {
																message : 'Seleccione la fecha'
															},
														}
													},
													proveedor : {
														validators : {
															notEmpty: {
																message : 'Seleccione el Proveedor'
															},
														}
													},
													cantidad : {
														validators : {
															notEmpty: {
																message : 'ingrese la cantidad'
															},
														}
													},
													descripcionDano : {
														validators : {
															notEmpty: {
																message : 'Ingrese Descripci�n del Da�o'
															},
														}
													}
											
											
										
												}
											});
						});
	</script>
		
		
		 
	<script>
			var popoverTriggerList = [].slice.call(document
					.querySelectorAll('[data-bs-toggle="popover"]'))
			var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
				return new bootstrap.Popover(popoverTriggerEl)
			})
	</script>

	<script>
			$(document).ready(function() {
		    	$('#tbexample').DataTable();
			} );

	</script>

	<script>
		$(document).ready(function() {
			$('.toast').toast('show');
		});
	</script>

</body>
</html>
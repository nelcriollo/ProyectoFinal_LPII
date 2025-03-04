<%
if (request.getSession().getAttribute("LISTAMenu") == null)
	response.sendRedirect("login.jsp");
%>

<jsp:include page="header.jsp" />

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movimiento de Inventario de Bienes</title>

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


	<form id="idRegistrarMovimientoAlmacen" method="post" action="ServletMovimientoAlmacen?tipo=REGISTRAR" class="row mx-5 my-4 border">
	
		<input type="hidden" class="form-control" id="idIdentificador" name="tipoOperacion" value=0>
		
			<div class="row mx-3 my-1">
			 <input type="hidden" class="form-control" id="idIdentificador" name="tipoOperacion" value="0">
					<div class="row mx-3 my-3">
				<div class="col-md-6 text-center p-2 lh-sm">
					<br>
					<h5 class="fw-bolder">RUC:20401381291</h5>
					<p>Av Abancay cuadra. 5 S/N, Lima,Per�</p>
					<p>Telf: 990990215 - 989435229</p>
				</div>

				<div class="col-md-3 text-center p-3 lh-sm border">
					
					<h6 class="col-form-label fw-bolder">Registro de Inventario</h6>
					<div class="row">
						<div class="mb-2 row g-2 d-flex justify-content-center mr-3">
							<div class="col-auto">
								<label for="inputPassword6" class="col-form-label fw-bolder">NRO:</label>
							</div>
							<div class="col-auto">
								<input type="text" id="miCodMovimiento" name="miCodMovimiento" value="0" class="form-control" aria-describedby="passwordHelpInline" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
			</div>

		<div class="col-md-2"></div>
	</div>
	
	
		<div class="row mx-4 my-2 mb-2">
			<h6 class="text-info">Ingreso y Salidas del inventario</h6>
		</div>

		<form class="row mx-5 my-3 p-3 border border-secondary">	
			<!-- Primer nivel -->
			<div class="col-md-3 mb-2 form-group quitar">
			    <label for="cboTipoMovimiento" class="form-label">Tipo de Movimiento</label>
			    <select id="miIdTipoMovimiento" name="miTipoMovimiento" class="form-select form-control">
			      <option value="" selected>--Seleccionar Movimiento--</option>
			    </select>
			</div>
			<div class="col-md-1 mb-2">
			</div>
			<div class="col-md-3 mb-2">
			    <label for="cboTipoBien" class="form-label">Tipo de Bien</label>
			    <select id="miIdTipoBien" name="miTipoBien" class="form-select form-control" readonly="readonly">
			    	<option value="" selected> --------- </option>
			    </select>
			</div>		
			<div class="col-md-3 mb-2">
			</div>
			<div class="col-md-2 mb-2">
			  	<button class="btn btn-dark btn-nuevo m-1 mt-4 col-md-7 p-1" type="reset">Nuevo</button>		    
			</div>	
			<!-- Segundo nivel -->		
			<div class="col-md-3 mb-2 form-group quitar">
			  	<label for="cboBien" class="form-label">Bien</label>
			    <select id="miIdBien" name="miBien" class="form-select form-control">
			      <option value="" selected>--Seleccionar Bien--</option>
			    </select>
			</div>	
			<div class="col-md-1 mb-2">
			</div>
			<div class="col-md-2 mb-2 form-group quitar">
			    <label for="txtCantidad" class="form-label">Cantidad</label>
			    <input type="text" class="form-control" id="miCantidad" name="miCantidad">
			</div>		
			<div class="col-md-4 mb-2">
			</div>
			<div class="col-md-2 mb-2">
			  	<button class="btn btn-dark btn-registrar m-1 mt-4 col-md-7 p-1" type="submit">Registrar</button>		    
			</div>
			<!-- Tercer nivel -->
		
		</form>
	</form>
	
	<!-- modal para eliminar -->
	<div class="modal fade" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">Sistema</h5>
	      </div>
	      <div class="modal-body">
	        <form id="idEliminarMovimientoAlmacen" method="post" action="ServletMovimientoAlmacen?tipo=ELIMINAR">
			    <input type="hidden" class="form-control" name="codigoEliminar" id="codigoEliminar">
			  <h4>�Seguro de eliminar?</h4>
			  <div class="modal-footer">
			  	<button type="submit" class="btn btn-primary">SI</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
		      </div>			  
			</form>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- Section: Tabla -->
	<div class="col-lg-12 col-sm-12 mt-4 table-responsive">	
		<table id="example" class="table table-striped table-sm" style="width: 100%; font-size: 13px">
		  	<thead>
		    	<tr class="table-success" >
					<th>C�DIGO</th>
					<th>TIPO DE MOVIMIENTO</th>
					<th>TIPO DE BIEN</th>
					<th >BIEN</th>
					<th >CANTIDAD</th>
		      		<th></th>
		      		
		    	</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.listaMovimientoAlmacen}" var="row">
					<tr>
					<td>${row.id_codMovimiento}</td>
					<td>${row.nombreMovimiento}</td>
					<td>${row.nom_tipoBien}</td>
					<td>${row.nombreBien}</td>
					<td>${row.cantidad}</td>
							
					<td><button type="button" class="btn btn-outline-danger btn-eliminar" data-bs-toggle="modal" data-bs-target="#modalEliminar"><i class="fas fa-backspace"></i></button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
	</div>
	
		</div>
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
	
		deshabilitarBotones();
		
		llenarcboTipoMovimiento();
		llenarcboBienes();
		
		DeshabilitarCajas();
		
		 function DeshabilitarCajas(){
		
		$("#miIdTipoMovimiento").prop('disabled', true);
		$("#miIdBien").prop('disabled', true);
		$("#miCantidad").prop('disabled', true);
	
		 }
		 
		 function habilitarCajas(){
				
			 $("#miIdTipoMovimiento").prop('disabled', false);
				$("#miIdBien").prop('disabled', false);
				$("#miCantidad").prop('disabled', false);
				 }
		 
		
		// Funcion para deshabilidar registrar al momento de cargar pagina
		function deshabilitarBotones(){			
			$('.btn-registrar').prop('disabled', true);
		}
		
		 // Funciones para llenar los select
		function llenarcboTipoMovimiento(){
			$.get("ServletTipoMovimientoJSON",function(response){
				$.each(response,function(index,item){
					$("#miIdTipoMovimiento").append("<option value='" + item.id_TipoMovimiento + "'>" + item.nombreMovimiento + "</option>");
				})
			})
		}
		
		function llenarcboBienes(){
				
			$.get("ServletEstadoBienJSON",function(response){
				$("#miIdTipoBien").empty();		
				$.each(response,function(index,item){
					$("#miIdBien").append("<option value='" + item.cod_bien + "'>" + item.descripcion + "</option>");
				})
			})
		}		
		
		// Evento llenar select tipo de bien a partir de la selecci�n de codigo bien 
		$('#miIdBien').on('change', function() {
			let codBien;
			codBien=$("#miIdBien").val();
			
			$.get("ServletBuscarNombreBienJSON?codigoBien="+codBien,function(response){
				$("#miIdTipoBien").empty();				
				$.each(response,function(index,item){
					$("#miIdTipoBien").append("<option value='"+item.cod_tipobien+"'>"+item.nom_tipoBien+"</option>");
				})			
			})
		})
		
		// Evento para btn-editar.
		/*$(document).on("click",".btn-editar",function(){
			
			$("#idIdentificador").val(1); //pasamos el valor de uno como indicadorpara actualizar
			$('.btn-registrar').text("Actualizar"); // para cambiar el texto del boton registrar
			$('.btn-nuevo').text("Cancelar"); // para cambiar el texto del boton Nuevo
			$('.btn-registrar').prop('disabled', false);// para habilitar el  boton registrar
			
        	let id_codMovimiento,id_tipoMovimiento,cod_tipobien,cod_bien,cantidad,descripcion_del_bien;
			
        	id_codMovimiento = $(this).parents("tr").find("td")[0].innerHTML;
        	id_tipoMovimiento = $(this).parents("tr").find("td")[1].innerHTML;
        	cod_tipobien = $(this).parents("tr").find("td")[2].innerHTML;
        	cod_bien = $(this).parents("tr").find("td")[3].innerHTML;
        	cantidad = $(this).parents("tr").find("td")[4].innerHTML;
        	descripcion_del_bien = $(this).parents("tr").find("td")[5].innerHTML;
        
	        $("#miCodMovimiento").val(id_codMovimiento);
	        $("#miIdTipoMovimiento").val(id_tipoMovimiento);
	        $("#miIdTipoBien").val(cod_tipobien);
	        $("#miIdBien").val(cod_bien);
	        $("#miCantidad").val(cantidad);
	        $("#miObservacion").val(descripcion_del_bien);   
   		 })*/
		
		// Evento para btn-editar.
		/*$(document).on("click", ".btn-editar", function() {			
			
			 $("#idIdentificador").val(1); //pasamos el valor de uno como indicadorpara actualizar
			 $('.btn-registrar').text("Actualizar"); // para cambiar el texto del boton registrar
			 $('.btn-nuevo').text("Cancelar"); // para cambiar el texto del boton Nuevo
			 $('.btn-registrar').prop('disabled', false);// para habilitar el  boton registrar
			 
			let codIdMov;
			 //obtenemos el valor de la columna(0), para paserle como parametro al ServletEditarMovimientoAlmacenJSON
			codIdMov = $(this).parents("tr").find("td")[0].innerHTML;
						
			$.get("ServletEditarMovimientoAlmacenJSON?codigoMov=" + codIdMov,function(response){				
				$("#miIdTipoMovimiento").val(response.id_tipoMovimiento);
				$("#miIdTipoBien").val(response.cod_tipobien);
				$("#miIdBien").val(response.cod_bien);
				$("#miCantidad").val(response.cantidad);
				$("#miObservacion").val(response.descripcion_del_bien);							
		})*/
   		 
   		// Evento para btn-eliminar.    	
	    $(document).on("click",".btn-eliminar",function(){
			let id_codMovimiento;
			id_codMovimiento=$(this).parents("tr").find("td")[0].innerHTML;
	 		$("#codigoEliminar").val(id_codMovimiento);
			
		})
   		 
   		// Evento para btn-nuevo.
		$(document).on("click", ".btn-nuevo", function() {
			if($('.btn-nuevo').text()=="Nuevo"){
				
				habilitarCajas();
			
				$("#miCodMovimiento").val(0);
				$("#miIdTipoMovimiento").val(0);
				$("#miIdTipoBien").text("");
				$("#miIdBien").val(0);
				$("#miCantidad").val("");
				$("#miObservacion").val("");
				$('.btn-registrar').text("Registrar"); // para cambiar el texto del boton registrar
				$('.btn-registrar').prop('disabled', false);// para habilitar el  boton registrar
				$('.btn-nuevo').text("Cancelar"); // para cambiar el texto del boton Nuevo
				$("#idIdentificador").val(0); //pasamos el valor de cero como indicadorpara registrar			
			}
			else {
				$("#miCodMovimiento").val(0);
				$("#miIdTipoMovimiento").val(0);
				$("#miIdTipoBien").text("");
				$("#miIdBien").val(0);
				$("#miCantidad").val("");
				$("#miObservacion").val("");
				$('.btn-registrar').text("Registrar"); // para cambiar el texto del boton registrar
				$('.btn-nuevo').text("Nuevo"); // para cambiar el texto del boton Nuevo	
				$('.quitar').removeClass('form-group');
				 $('.quitar').removeClass('has-error ');
				 $('.quitar').removeClass('form-control-label');
				 $('small').hide('help-block');
				 $('.btn-registrar').prop('disabled', true);
				 DeshabilitarCajas();
					
			}
	
		})
		
		 $(document).on("click", ".btn-registrar", function() {
				
				if( $('.btn-registrar').text()=="Registrar"){
				if( $("#miIdTipoMovimiento").val()=="" || $("#miIdBien").val()==""||$("#miCantidad").val()==""){    
					
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
	
	
	
		var popoverTriggerList = [].slice.call(document
				.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#idRegistrarMovimientoAlmacen').bootstrapValidator(
								{
									
												fields : {
													
													miTipoMovimiento : {     
														validators : {
															notEmpty: {
																message : 'Seleccione el tipo de movimiento'
															},
														}
													},
													miCantidad : {
														validators : {
															notEmpty: {
																message : 'ingrese la cantidad'
															},
														}
													},
													miBien : {
														validators : {
															notEmpty: {
																message : 'ingrese un bien'
															},
														}
													}
											
											
										
												}
											});
						});
	</script>
	
	<script>
			$(document).ready(function() {
		    	$('#example').DataTable();
			} );

	</script>
	
	<script>
		$(document).ready(function() {
			$('.toast').toast('show');
		});
	</script>
	
</body>
</html>
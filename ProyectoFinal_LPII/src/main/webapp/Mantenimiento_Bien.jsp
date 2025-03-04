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
<title>Mantenimiento de Acceso</title>
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

<form id="IdRegistrarBienes" method="post" action="ServletBien?tipo=REGISTRAR"  class="form-horizontal border mt-3">
	<div class="row mx-5 my-4">
			
					<div class="row mx-5 my-4">
				<div class="col-md-6 text-center p-3 lh-sm">
					<br>
					<h6 class="fw-bolder">RUC:20401381291</h6>
					<p>Av Abancay cuadra. 5 S/N, Lima,Per�</p>
					<p>Telf: 990990215 - 989435229</p>
				</div>

				<div class="col-md-3 text-center p-3 lh-sm border">
					
					<h6 class="fw-bolder">Registro de Bien</h6>
					<div class="row" >
						<div class="mb-2 row g-2 d-flex justify-content-center mr-3 form-group">
							<div class="col-auto ">
								<label for="inputPassword6" class="col-form-label fw-bolder">NRO:</label>
							</div>
							<div class="col-auto ">
								<input type="text" id="idBien" name="codbien"
									value="0" class="form-control"readonly="readonly"
									aria-describedby="passwordHelpInline">
							</div>
						</div>
					</div>
				</div>
			</div>

		<div class="col-md-2"></div>
	</div>

	<div class="row mx-2">
		<h6>Datos de Registro de Bienes</h6>
		
			 <input type="hidden" class="form-control" id="idIdentificador" name="tipoOperacion">
		
	<div class="col-ms-12 col-lg-9">
<div class="row"> 
	<div class="col-lg-5 col-md-6 col-sm-12 form-group"id="tipob">
   <label for="mpTipoDeBienes" class=" col-6 col-form-label">Tipo de Bienes</label>
   <select id="idTipoDeBien" name="tipobien" class="form-select form-control"><option value="" selected>Seleccionar</option>
</select>
  </div>
  
  <div class="col-lg-5 col-md-6 col-sm-12 form-group">
    <label for="txtCantidad" class="col-6 col-form-label">Stock</label>
    <input type="text" id="idCantidad" name="cant" class="form-control">
  </div>
  </div>
  <div class="row mb-5"> 
  <div class="col-lg-5 col-md-6 col-sm-12 form-group">
   	<label for="mpEstado" class="col-6 col-form-label">Estado</label>
   	<select id="idEstado" name="estado" class="form-select form-control">
<option value="" selected>Seleccionar</option>
<option value="Desaprobado">Desaprobado</option>
<option value="Aprobado" >Aprobado</option>								
</select>
  </div>
  <div class="col-lg-5 col-md-6 col-sm-12 form-group">
   <label for="txtNombredelBien" class=" col-6 col-form-label">Descripcion del Bien</label>
   <input type="text" id="idDescrip" name="desbien" class="form-control">
  </div>
    </div>
  </div>
  
  	<div class="col-ms-12 col-lg-3 m-auto">
			<div class="row p-3">
							<div class="col-md-12 col-lg-12">
					<div class="row my-1 p-1">
						<div class="col-lg-12 d-grid">
							<button class="btn btn-dark btn-nuevo" type="reset">Nuevo</button>
						</div>

					</div>
					<div class="row my-1 p-1">
						<div class="col-lg-12 d-grid">
							<button type="submit"  class="btn btn-primary btn-registrar" disabled="disabled">Registrar</button>
						</div>

					</div>
				</div>
			</div>
			</div>


	</div>
		</form>

		<!-- Modal para Eliminar-->
					<div class="modal fade" id="modalElimimar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h7 class="modal-title" id="exampleModalLabel">Sistema</h7>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        	<form id="idEliminar" method="post"
							action="ServletBien?tipo=ELIMINAR">
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


			<div class="col mt-4 table-responsive">
					<table id="example" class="table table-striped" style="width: 100%; font-size: 12px">
						<thead class="table-success">
							<tr>
							    <th>CODIGO</th>
								<th>DESCRIPCION</th>
								<th>TIPO_BIEN</th>
								<th>STOCK</th>
								<th>ESTADO</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.listaBienes}" var="row">
								<tr>
									<td>${row.cod_bien}</td>
									<td>${row.descripcion}</td>
									<td>${row.nombreTipo}</td>
									<td>${row.stock}</td>
									<td>${row.estado}</td>
									


									<td class="p-1"><button type="button"
											class="btn btn-outline-success btn-sm align-top btn-editar"
											data-bs-toggle="modal" data-bs-target="#staticBackdrop"
											id="idbtn-editar"> <i class="fas fa-edit"></i></button></td>
									<td class="p-1"><button type="button"
											class="btn btn-outline-danger btn-sm align-top p-1"
											data-bs-toggle="modal" data-bs-target="#modalElimimar"><i class="fas fa-backspace"></i></button></td>

								</tr>
							</c:forEach>

						</tbody>

					</table>
				</div>
</div>




<jsp:include page="footer.jsp"/>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
			<scripts
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
			llenarcboTipoBien();
			DeshabilitarCajas();
			
			 function DeshabilitarCajas(){
			
			$("#idTipoDeBien").prop('disabled', true);
			$("#idNomBien").prop('disabled', true);
			$("#idDescrip").prop('disabled', true);
			$("#idCantidad").prop('disabled', true);
			$("#idEstado").prop('disabled', true);
	
			 }
	
			 function habilitarCajas(){
					
					$("#idTipoDeBien").prop('disabled', false);
					$("#idNomBien").prop('disabled', false);
					$("#idDescrip").prop('disabled', false);
					$("#idCantidad").prop('disabled', false);
					$("#idEstado").prop('disabled', false);
			
					 }
			 
		 //fuciones para llenar los select
		 function llenarcboTipoBien(){
			$.get("ServletTipoBienJSON",function(response){
				$.each(response,function(index,item){
					$("#idTipoDeBien").append("<option value='"+item.cod_tipobien+"'>"+item.nom_tipoBien+"</option>");
				})
			})
		}
			</script>
			
		<script type="text/javascript">
		
		//funcion para el btn-nuevo 
		$(document).on("click", ".btn-nuevo", function() {
			
			 
			if( $('.btn-nuevo').text()=="Nuevo"){           
			
				     habilitarCajas();
					$("#idBien").val(0);
					$("#idTipoDeBien").val("");
					$("#idNomBien").val("");
					$("#idDescrip").val("");
					$("#idCantidad").val("");
					$("#idEstado").val("");
					
					 $('.btn-registrar').text("Registrar"); // para cambiar el texto del boton registrar
					 $('.btn-registrar').prop('disabled', false);// para habilitar el  boton registrar
					 $('.btn-nuevo').text("Cancelar"); // para cambiar el texto del boton Nuevo
					 $("#idIdentificador").val(0); //pasamos el valor de cero como indicadorpara registrar
			
			  }else{
				  $("#idBien").val(0);
					$("#idTipoDeBien").val("");
					$("#idNomBien").val("");
					$("#idDescrip").val("");
					$("#idCantidad").val("");
					$("#idEstado").val("");
					 $('.btn-registrar').text("Registrar"); // para cambiar el texto del boton registrar
					 $('.btn-nuevo').text("Nuevo"); // para cambiar el texto del boton Nuevo
					 $('.btn-registrar').prop('disabled', true);// para deshabilitar el  boton registrar
					 $('.col-md-6').removeClass('form-group');
					 $('.col-md-6').removeClass('has-error ');
					 $('.col-md-6').removeClass('form-control-label');
					 $('small').hide('help-block');
					 
					
					 
					 DeshabilitarCajas();
			  }
		
		})
		
		
				//asignamos evento a todos los botones("editar") con nombre de clase "btn-editar"
		$(document).on("click", ".btn-editar", function() {
			
			 habilitarCajas();
			 $('.btn-registrar').prop('disabled', true);// para deshabilitar el  boton registrar
			 $('.col-md-6').removeClass('form-group');
			 $('.col-md-6').removeClass('has-error ');
			 $('.col-md-6').removeClass('form-control-label');
			 $('small').hide('help-block');
			 $("#idIdentificador").val(1); //pasamos el valor de uno como indicadorpara actualizar
			 $('.btn-registrar').text("Actualizar"); // para cambiar el texto del boton registrar
			 $('.btn-nuevo').text("Cancelar"); // para cambiar el texto del boton Nuevo
			 $('.btn-registrar').prop('disabled', false);// para habilitar el  boton registrar
			
			 
			let codigo;
			 //obtenemos el valor de la columna(0), para paserle como parametro al ServletAccesoJSON
			codigo = $(this).parents("tr").find("td")[0].innerHTML;
			
			
			$.get("ServletBuscarBienJSON",{"codbien":codigo},function(response){
				console.log(response);
				$("#idBien").val(response.cod_bien);
				$("#idTipoDeBien").val(response.tipo_bien);
				$("#idDescrip").val(response.descripcion);
				$("#idCantidad").val(response.stock);
				$("#idEstado").val(response.estado);
				
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

		})
		
		</script>
				<script type="text/javascript">
		$(document).ready(function() {
			$('#IdRegistrarBienes').bootstrapValidator(
								{
									
												fields : {
													
													tipobien : {
														validators : {
															notEmpty: {
																message : 'Selecione un tipo de bien'
															},
														}
													},
													cant : {
														validators : {
															notEmpty: {
																message : 'ingrese cantidad'
															},
														}
													},
													estado : {
														validators : {
															notEmpty: {
																message : 'Selecione una un estado'
															},
														}
													},
													desbien : {
														validators : {
															notEmpty: {
																message : 'ingrese una descripci�n'
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





<%
if (request.getSession().getAttribute("LISTAMenu") == null)
	response.sendRedirect("login.jsp");
%>
<jsp:include page="header.jsp" />

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

		<div class="row ">
			<h1 class="text-center mt-5">Mantenimiento de Aceso<img src="img/llave.svg" class="img-thumbnail ms-3 mb-5" width="75"></h1>
				
	
			<div class="row ms-0 d-flex p-2">
				<div class="col mt-5">
					<form id="idRegistrar" method="post"
						action="ServletAcceso?tipo=REGISTRAR"
						class="row rounded p-2 border">
				
							 <input type="hidden" class="form-control" id="idIdentificador" name="tipoOperacion">
							
						<div class="col-md-6 form-group">
							<label for="inputState" class="form-label">C�digo</label>
							 <input type="text" class="form-control" id="idcodigo" name="codAcc" readonly="readonly">
							</div>

						<div class="col-md-6 form-group quitar">
							<label for="inputState" class="form-label">Usuario</label> <select
								id="idUser" class="form-select form-control" name="user">
								<option value="" selected>--Seleccione Usuario--</option>

							</select>
						</div>
						<div class="col-md-6 form-group quitar">
							<label for="inputState" class="form-label">Menu</label> <select
								id="idcodMenu" class="form-select form-control" name="menu">
								<option value="" selected>--Seleccione Men�--</option>

							</select>
						</div>

						<div class="col-md-12 form-group quitar">
							<label for="inputState" class="form-label">Opcion de Menu</label>
							<select id="idcodOpcionMemu" class="form-select form-control"
								name="opcionMemu">
								<option value="" selected>--Seleccione Opcionde Menu--</option>

							</select>
						</div>


						<div class="row d-flex justify-content-center">
							<div class="col-3 p-2">
								<button type="submit" class="btn btn-primary btn-registrar"  disabled="disabled">Registrar</button>
							</div>
							<div class="col-3 p-2">
								<button type="button" class="btn btn-secondary btn-nuevo">Nuevo</button>
							</div>
						</div>
					</form>
				</div>
					
					<!-- Modal para Eliminar-->
					<div class="modal fade" id="modalElimimar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h7 class="modal-title" id="exampleModalLabel">Sistema</h7>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        	<form id="idRegistrar" method="post"
							action="ServletAcceso?tipo=ELIMINAR">
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

				<div class="col mt-4">
					<table id="example" class="table table-striped" style="width: 100%; font-size: 12px">
						<thead class="table-dark">
							<tr>
							    <th>CODIGO</th>
								<th>MODULO</th>
								<th>USUARIO</th>
								<th>OPCION DE MENU</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.listaAccesos}" var="row">
								<tr>
									<td>${row.cod_acceso}</td>
									<td>${row.des_menu}</td>
									<td>${row.login_usuario}</td>
									<td>${row.des_rol}</td>


									<td class="p-1"><button type="button"
											class="btn btn-outline-success btn-sm align-top btn-editar"
											data-bs-toggle="modal" data-bs-target="#staticBackdrop"
											id="idbtn-editar"><i class="fas fa-edit"></i></button></td>
									<td class="p-1"><button type="button"
											class="btn btn-outline-danger btn-sm align-top p-1"
											data-bs-toggle="modal" data-bs-target="#modalElimimar"><i class="fas fa-backspace"></i></button></td>

								</tr>
							</c:forEach>

						</tbody>

					</table>
				</div>

			</div>
		</div>
	</div>
	<br>
	<br>

	<jsp:include page="footer.jsp" />



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
			llenarCboMenu();
			llenarcboUsuario();
			
			
			DeshabilitarCajas();
			
			 function DeshabilitarCajas(){
			
			$("#idcodigo").prop('disabled', true);
			$("#idUser").prop('disabled', true);
			$("#idcodMenu").prop('disabled', true);
			$("#idcodOpcionMemu").prop('disabled', true);
			
			 }
	
			 function habilitarCajas(){
					
				 $("#idcodigo").prop('disabled', false);
					$("#idUser").prop('disabled', false);
					$("#idcodMenu").prop('disabled', false);
					$("#idcodOpcionMemu").prop('disabled', false);
			
					 }
			 
		
		 //fuciones para llenar los select
		 function llenarcboUsuario(){
			$.get("ServletUsuarioJSON",function(response){
				$.each(response,function(index,item){
					$("#idUser").append("<option value='"+item.cod_usuario+"'>"+item.login_usuario+"</option>");
				})
			})
		}
		
		
		function llenarCboMenu(){
			$.get("ServletMenuJSON",function(response){
				$.each(response,function(index,item){
					$("#idcodMenu").append("<option value='"+item.cod_menu+"'>"+item.des_menu+"</option>");
				})
			})
		}
		
		
		//funcion para llenar el select Opciones de menu Segun el c�digo del modulo principal
		 $('#idcodMenu').on('change', function() {
			let codmenu;
			codmenu=$("#idcodMenu").val();
			 
			$.get("ServletRolMenuJSON?rolesmenu="+codmenu,function(response){
				$("#idcodOpcionMemu").empty();
				$('#idcodOpcionMemu').append('<option value="" selected>--Seleccione Opcionde Men�--</option>');
				$.each(response,function(index,item){
					$("#idcodOpcionMemu").append("<option value='"+item.cod_rolmenu+"'>"+item.des_rolmenu+"</option>");
				})
			})
		})	
			
		
		//asignamos evento a todos los botones("editar") con nombre de clase "btn-editar"
		$(document).on("click", ".btn-editar", function() {
			
			habilitarCajas();
			let codmenu;
			let codigo;
			codmenu=$("#idcodMenu").val();
			 //obtenemos el valor de la columna(0), para paserle como parametro al ServletAccesoJSON
			codigo = $(this).parents("tr").find("td")[0].innerHTML;
			 
			$('.quitar').removeClass('form-group');
			 $('.quitar').removeClass('has-error');
			 $('.quitar').removeClass('form-control-label');
		
			
			 $('small').hide('help-block');
			
			
			$.get("ServletRolMenuJSON?rolesmenu="+codmenu,function(response){
				$("#idcodOpcionMemu").empty();
				$('#idcodOpcionMemu').append('<option value="" selected>--Seleccione Opcionde Men�--</option>');
				$.each(response,function(index,item){
					$("#idcodOpcionMemu").append("<option value='"+item.cod_rolmenu+"'>"+item.des_rolmenu+"</option>");
					
				})
				
			})
			
			
			 $("#idIdentificador").val(1); //pasamos el valor de uno como indicadorpara actualizar
			 $('.btn-registrar').text("Actualizar"); // para cambiar el texto del boton registrar
			 $('.btn-nuevo').text("Cancelar"); // para cambiar el texto del boton Nuevo
			 $('.btn-registrar').prop('disabled', false);// para habilitar el  boton registrar
			 
			 
			
			
			
			$.get("ServletAccesoJSON",{"codigo":codigo},function(response){
				console.log(response);
				
				$("#idcodigo").val(response.cod_acceso);
				$("#idUser").val(response.cod_usuario);
				$("#idcodMenu").val(response.cod_menu);
				$("#idcodOpcionMemu").val(response.cod_Rol);
				
					
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
		
		$(document).on("click", ".btn-registrar", function() {
			
			if( $('.btn-registrar').text()=="Registrar"){
			if( $("#idUser").val()=="" || $("#idcodMenu").val()==""||$("#idcodOpcionMemu").val()==""){    
				
				$('.quitar').addClass('form-group');
				 $('.quitar').addClass('has-error ');
				 $('.quitar').addClass('form-control-label');
				 $('small').show('help-block');
			}
			}else if( $('.btn-registrar').text()=="Actualizar"){
				 $('.quitar').removeClass('form-group');
				 $('.quitar').removeClass('has-error ');
				 $('.quitar').removeClass('form-control-label');
				 $('small').hide('help-block');
			
			}
		})
		
		//funcion para el btn-nuevo 
		$(document).on("click", ".btn-nuevo", function() {
			
			 
			if( $('.btn-nuevo').text()=="Nuevo"){           
				$.get("ServletObtenerCodAccesoJSON",function(response){
					$("#idcodigo").val(response);
					
					$("#idUser").val("");
					$("#idcodMenu").val("");
					$("#idcodOpcionMemu").val("");
					
					 $('.btn-registrar').text("Registrar"); // para cambiar el texto del boton registrar
					 $('.btn-registrar').prop('disabled', false);// para habilitar el  boton registrar
					 $('.btn-nuevo').text("Cancelar"); // para cambiar el texto del boton Nuevo
					 $("#idIdentificador").val(0); //pasamos el valor de cero como indicadorpara registrar
					 habilitarCajas();
					 
					 
				})
			  }else{
				  $("#idcodigo").val("");
					$("#idUser").val("");
					$("#idcodMenu").val("");
					$("#idcodOpcionMemu").val("");
					 $('.btn-registrar').text("Registrar"); // para cambiar el texto del boton registrar
					 $('.btn-nuevo').text("Nuevo"); // para cambiar el texto del boton Nuevo
					 $('.btn-registrar').prop('disabled', true);// para deshabilitar el  boton registrar
					 $('.quitar').removeClass('form-group');
					 $('.quitar').removeClass('has-error ');
					 $('.quitar').removeClass('form-control-label');
					 $('small').hide('help-block');
					DeshabilitarCajas();
			  }
		
		})
		
		</script>
		
		<script type="text/javascript">
		$(document).ready(function() {
			$('#idRegistrar').bootstrapValidator(
								{
									
												fields : {
													
													user : {
														validators : {
															notEmpty: {
																message : 'Selecione un Usuario'
															},
														}
													},
													menu : {
														validators : {
															notEmpty: {
																message : 'Selecione un Menu'
															},
														}
													},
													opcionMemu : {
														validators : {
															notEmpty: {
																message : 'Selecione una opcion de Menu'
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
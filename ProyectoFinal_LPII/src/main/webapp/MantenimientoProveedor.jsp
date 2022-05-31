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
<title>Mantenimiento Proveedor</title>

<!--  jquery-->
<link rel="stylesheet"
	href=" https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

<!-- Los iconos tipo Solid de Fontawesome-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Los estilos de Bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Los estilos locales de la carpeta css de proyecto-->
<link rel="stylesheet" href="./css/menu.css">

</head>

<body>

	<form id="idRegistrarProveedor" method="post" action="ServletProveedor?tipo=REGISTRAR" class="row mx-5 my-3 p-3">
	
		<div class="row mx-5 my-4">
			<div class="col-md-6 text-center p-3 lh-sm">
				<br>
				<h5>Registro de Proveedores</h5>
				<p>Av Abancay cuadra. 5 S/N, Lima,Per�</p>
				<p>Telf: 990990215 - 989435229</p>
			</div>
			
			<div class="col-md-3 text-center p-3 lh-sm border border-secondary">
				<h3>RUC:20401381291</h3>
				<h3>Registro de Proveeedores</h3>
				<div class="row">
					<div class="mb-2 row g-3 d-flex justify-content-center mr-3">
						<div class="col-auto">
						<label for="inputPassword6" class="col-form-label">NRO:</label>
						</div>
						<div class="col-auto">
				    		<input type="text" id="mpIdProveedor" name="mpIdProveedor" value="0" class="form-control" aria-describedby="passwordHelpInline">
						</div>
					</div>						
				</div>
			</div>
		</div>
		
		<c:if test="${requestScope.MENSAJE!=null}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<strong>MENSAJE : </strong> ${requestScope.MENSAJE} 
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>
		
		<div class="row mx-4 my-2 mb-2">
			<h1>Datos del Proveedor</h1>
		</div>	
	
		<form class="row mx-5 my-3 p-3 border border-secondary">
			<!-- Primer nivel -->
			<div class="col-md-3 mb-2">
			  	<label for="inputEmail4" class="form-label">Raz�n Social</label>
			    <input type="text" class="form-control" id="mpRazonSocial" name="mpRazonSocial" requestFocus="true">
			</div>		
			<div class="col-md-1 mb-2">		    
			</div>
			<div class="col-md-5 mb-2">
			    <label for="inputPassword4" class="form-label">Direcci�n</label>
			    <input type="text" class="form-control" id="mpDireccion" name="mpDireccion">
			</div>		
			<div class="col-md-1 mb-2">
			</div>
			<div class="col-md-2 mb-2">
			  	<button class="btn btn-dark m-1 mt-4 col-md-7 p-1" type="reset">Nuevo</button>		    
			</div>
			<!-- Segundo nivel -->
			<div class="col-md-3 mb-2">
			  	<label for="inputEmail4" class="form-label">Email</label>
			    <input type="email" class="form-control" id="mpEmail" name="mpEmail">
			</div>
			<div class="col-md-1 mb-2">
			</div>
			<div class="col-md-3 mb-2">
			    <label for="inputPassword4" class="form-label">RUC</label>
			    <input type="text" class="form-control" id="mpRuc" name="mpRuc">
			</div>
			<div class="col-md-3 mb-2">
			</div>
			<div class="col-md-2 mb-2">
			  	<button class="btn btn-dark m-1 mt-4 col-md-7 p-1" type="submit">Grabar</button>		    
			</div>
			<!-- Tercer nivel -->
			<div class="col-md-3 mb-2">
			  	<label for="inputEmail4" class="form-label">Nombre Comercial</label>
			    <input type="text" class="form-control" id="mpNombreComercial" name="mpNombreComercial">
			</div>		
			<div class="col-md-1 mb-2">
			</div>
			<div class="col-md-3 mb-2">
				<label for="inputPassword4" class="form-label">Telefono</label>
			    <input type="text" class="form-control" id="mpTelefono" name="mpTelefono">
			</div>		
			<div class="col-md-5 mb-2">
			</div>
			<!-- Cuarto nivel -->
						<div class="col-md-3 mb-2">
				<label for="inputPassword4" class="form-label">Departamento</label>
			    <input type="text" class="form-control" id="mpDepartamento" name="mpDepartamento">
			</div>	
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
		        <form id="idRegistrar" method="post" action="ServletProveedor?tipo=ELIMINAR">
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
	

	<div class="row mx-4 my-2 mb-5">	
		<table id="example" class="table table-bordered table-hover mx-1 my-2 mb-3">
		  	<thead>
		    	<tr class="text-center text-white" style="background-image: radial-gradient(circle at 119.64% 37.72%, #18344a 0, #010912 50%, #000000 100%);">
			      	<th scope="col">C�DIGO</th>
			      	<th scope="col">RAZ�N SOCIAL</th>
			      	<th scope="col">NOMBRE COMERCIAL</th>
			      	<th scope="col">RUC</th>
			      	<th scope="col">EMAIL</th>
			      	<th scope="col">DIRECCI�N</th>
			      	<th scope="col">DEPARTAMENTO</th>
		      		<th scope="col">TELEFONO</th>
			      	<th scope="col">EDITAR</th>
		      		<th scope="col">ELIMINAR</th>
		    	</tr>
			</thead>
			<tbody>
			    <c:forEach items="${requestScope.listaProveedor}" var="row">
					<tr>
					<td>${row.id_proveedor}</td>
					<td>${row.razon_social}</td>
					<td>${row.nombre_comercial}</td>
					<td>${row.numero_ruc}</td>
					<td>${row.email}</td>
					<td>${row.direccion}</td>
					<td>${row.departamento}</td>
					<td>${row.telefonos}</td>
					<td><button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar</button></td>
					<td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
	</div>
	
	<jsp:include page="footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous">
	</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
	
	<!-- JS para validaci�n-->
	<script
		src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js">
	</script>
	
	<script>
		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})
		
		
		$(document).on("click",".btn-EditarDatos",function(){
        let id_proveedor,razon_social,nombre_comercial,numero_ruc,email,direccion,departamento,telefonos;
       
        id_proveedor = $(this).parents("tr").find("td")[0].innerHTML;
        razon_social = $(this).parents("tr").find("td")[1].innerHTML;
        nombre_comercial = $(this).parents("tr").find("td")[2].innerHTML;
        numero_ruc = $(this).parents("tr").find("td")[3].innerHTML;
        email = $(this).parents("tr").find("td")[4].innerHTML;
        direccion = $(this).parents("tr").find("td")[5].innerHTML;
        departamento = $(this).parents("tr").find("td")[6].innerHTML;
        telefonos = $(this).parents("tr").find("td")[7].innerHTML;
        
        $("#mpIdProveedor").val(id_proveedor);
        $("#mpRazonSocial").val(razon_social);
        $("#mpNombreComercial").val(nombre_comercial);
        $("#mpRuc").val(numero_ruc);
        $("#mpEmail").val(email);
        $("#mpDireccion").val(direccion);
        $("#mpDepartamento").val(departamento);
        $("#mpTelefono").val(telefonos);
    
    	})
    	
    	$(document).on("click",".btn-danger",function(){
		//variable
		let id_proveedor;
		//obtener el c�digo del docente seg�n el bot�n eliminar que se a pulsado
		id_proveedor=$(this).parents("tr").find("td")[0].innerHTML;
		//asignar a la caja con id "codigoEliminar" el valor de la variable "cod"
 		$("#codigoEliminar").val(id_proveedor);
		
	})
		
	</script>
</body>
</html>
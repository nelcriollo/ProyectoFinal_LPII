

<jsp:include page="header.jsp" />
<jsp:include page="footer.jsp" />

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

</head>

<body>

	<form class="row mx-5 my-4">
		<div class="col-md-6 text-center p-3 lh-sm">
			<br>
			<h5>Control de Inventario de Bienes</h5>
			<p>Av Abancay cuadra. 5 S/N, Lima,Perú</p>
			<p>Telf: 990990215 - 989435229</p>
		</div>
		
		<div class="col-md-3 text-center p-3 lh-sm border border-secondary">
			<h3>RUC:20401381291</h3>
			<h3>Registro de Control de Inventario</h3>
			<div class="row">
				<div class="mb-2 row g-3 d-flex justify-content-center mr-3">
					<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">NRO:</label>
					</div>
					<div class="col-auto">
			    		<input type="text" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
					</div>
				</div>						
			</div>
		</div>
	</form>
	
	<div class="row mx-1 my-1 mb-2">
		<h1>Datos de los Bienes Ingresados</h1>
	</div>	

	<form class="row mx-5 my-3 p-3 border border-secondary">	
		<!-- Primer nivel -->
		<div class="col-md-3 mb-2">
		    <label for="inputState" class="form-label">Tipo de Inventario</label>
		    <select id="saTipoIventario" class="form-select">
		      <option selected>Seleccionar</option>
		      <option>Tipo1</option>
		      <option>Tipo2</option>
		      <option>Tipo3</option>
		    </select>
		</div>
		<div class="col-md-1 mb-2">
		</div>		
		<div class="col-md-5 mb-2">
		  	<label for="inputEmail4" class="form-label">Descripción</label>
		    <input type="email" class="form-control" id="saDescripcion">
		</div>		
		<div class="col-md-1 mb-2">
		</div>
		<div class="col-md-2 mb-2">
		  	<button class="btn btn-dark m-1 mt-4 col-md-7 p-1" type="submit">Nuevo</button>		    
		</div>	
		<!-- Segundo nivel -->		
		<div class="col-md-3 mb-2">
		    <label for="inputState" class="form-label">Fecha de Entrega</label>
		    <input type="date" id="saFechaEntrega" class="form-control" aria-describedby="passwordHelpInline">
		</div>		
		<div class="col-md-1 mb-2">
		</div>
		<div class="col-md-2 mb-2">
		    <label for="inputPassword4" class="form-label">Cantidad</label>
		    <input type="email" class="form-control" id="saCantidad">
		</div>		
		<div class="col-md-4 mb-2">
		</div>
		<div class="col-md-2 mb-2">
		  	<button class="btn btn-dark m-1 mt-4 col-md-7 p-1" type="submit">Grabar</button>		    
		</div>
		<!-- Tercer nivel -->
		<div class="col-md-3 mb-2">
		  	<label for="inputEmail4" class="form-label">Código Bienes</label>
		    <input type="email" class="form-control" id="saCodigoBienes">
		</div>
	</form>

	<!-- Section: Tabla -->
	<div class="row mx-4 my-2 mb-5">	
		<table id="example" class="table table-bordered table-hover mx-1 my-2 mb-3">
		  	<thead>
		    	<tr class="text-center text-white" style="background-image: radial-gradient(circle at 119.64% 37.72%, #18344a 0, #010912 50%, #000000 100%);">
			      <th scope="col">CÓDIGO</th>
			      <th scope="col">TIPO DE MOVIMIENTO</th>
			      <th scope="col">TIPO DE BIEN</th>
			      <th scope="col">CODIGO BIENES</th>
			      <th scope="col">CANTIDAD</th>
			      <th scope="col">DESCRIPCION</th>
			      	<th scope="col">EDITAR</th>
		      		<th scope="col">ELIMINAR</th>
		    	</tr>
			</thead>
			<tbody>
			    <tr>      
				    <td>1</td>
				    <td>Prueba SAC</td>
				    <td>Prueba SAC</td>      
				    <td>202020203698521</td>
				    <td>Prueba@gmail.com</td>
				    <td>Av. Prueba #150</td>					
					<td><button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalRegistrar">Editar</button></td>
			        <td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button></td>
			    </tr>
			    <tr>      
				    <td>1</td>
				    <td>Prueba SAC</td>
				    <td>Prueba SAC</td>      
				    <td>202020203698521</td>
				    <td>Prueba@gmail.com</td>
				    <td>Av. Prueba #150</td>					
					<td><button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalRegistrar">Editar</button></td>
			        <td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button></td>
			    </tr>
			    <tr>      
				    <td>1</td>
				    <td>Prueba SAC</td>
				    <td>Prueba SAC</td>      
				    <td>202020203698521</td>
				    <td>Prueba@gmail.com</td>
				    <td>Av. Prueba #150</td>					
					<td><button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalRegistrar">Editar</button></td>
			        <td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button></td>
			    </tr>
			</tbody>
		</table>	
	</div>

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
	
	<!-- JS para validación-->
	<script
		src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js">
	</script>
	
	<script>
		var popoverTriggerList = [].slice.call(document
				.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})
	</script>
</body>
</html>
<% 
if (request.getSession().getAttribute("LISTAMenu") == null)
	response.sendRedirect("login.jsp");
%>
<jsp:include page="header.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/brands.min.css"
	integrity="sha512-OivR4OdSsE1onDm/i3J3Hpsm5GmOVvr9r49K3jJ0dnsxVzZgaOJ5MfxEAxCyGrzWozL9uJGKz6un3A7L+redIQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/fontawesome.min.css"
	integrity="sha512-xX2rYBFJSj86W54Fyv1de80DWBq7zYLn2z0I9bIhQG+rxIF6XVJUpdGnsNHWRa6AvP89vtFupEPDP8eZAtu9qA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css"
	rel="stylesheet">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="./css/quienes_somos.css">
</head>
<body>
	
<div class="container">
	
			<h1 class="text-center mt-5">Reporte de Orden de Compra<img src="img/repor.png" class="img-thumbnail" width="100" height="70"class="d-inline-block align-text-top"></h1>
			<br>
	<div class="mt-4">
			<table id="example" class="table table-striped" style="width:100%">
		        <thead>
		            <tr class="table-success">
		                <th>Num. O.C.</th>
		                <th>Fecha O.C.</th>
		                <th>Fecha_Entrega</th>
		                <th>Cod Proveedor</th>
		                <th>Condición de Pago</th>
		                <th>Embalaje</th>
		                <th>Transporte</th>
		                <th>Valor Total O.C.</th>
		            </tr>
		        </thead>
	 			
		         <tfoot>
		            <tr>
		               <th>Num. O.C.</th>
		                <th>Fecha O.C.</th>
		                <th>Fecha_Entrega</th>
		                <th>Cod Proveedor</th>
		                <th>Condición de Pago</th>
		                <th>Embalaje</th>
		                <th>Transporte</th>
		                <th>Valor Total O.C.</th>
		            </tr>
		        </tfoot>
		    </table>
		</div>	
</div>
    <br> <br>
	<jsp:include page="footer.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

<!-- JS para validación-->
<script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>
<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>

</body>
</html>
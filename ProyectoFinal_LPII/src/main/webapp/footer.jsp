<% 
if (request.getSession().getAttribute("LISTAMenu") == null)
	response.sendRedirect("login.jsp");
%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>



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
<link rel="stylesheet" href="./css/header.css">

<footer class="text-center text-white  h-auto navbar-dark fondonavsup">
	<br>
	<div class="container p-1">

		<div class="row fs-15">
			<div class="col-lg-3 mb-6 mb-lg-0">
				<h7 class="text-uppercase fw-bolder">UBICACI�N</h7>
				<p>
					Av. Abancay 5, <br> Cercado de Lima 15001
				</p>
			</div>
			<div class="col-lg-6 mb-12 mb-lg-0">
				<!-- Section: Social media -->
				<section class="mb-4">
					<h6>Ministerio P�blico - Fiscal�a de la Naci�n 2022</h6>

					<a class="btn btn-outline-light btn-social mx-1"
						href="https://es-la.facebook.com/"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1"
						href="https://twitter.com/"><i class="fab fa-fw fa-twitter"></i></a>
					<a class="btn btn-outline-light btn-social mx-1"
						href="https://www.youtube.com/"><i
						class="fab fa-fw fa-youtube"></i></a>
				</section>
			</div>
			<!--Grid column-->
			<div class="col-lg-3 mb-3 mb-lg-0">
				<h7 class="text-uppercase fw-bolder">CONTACTO</h7>
				<p>
					Central Telef�nica: <br> 625-5555<br> L�nea Gratuita:<br>
					0-800-00-205
				</p>
			</div>
			
			<div class="text-center p-2">� Derechos
		Reservados</div>
		</div>
		
	</div>
	
</footer>




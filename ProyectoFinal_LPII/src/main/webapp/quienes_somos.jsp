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
<title>Insert title here</title>

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
	
</head>
<body>	
			<section class="page-section portfolio" id="portfolio">
        	<div class="container">
			<h1 class="text-center mt-5">¿Quiénes Somos?<img src="img/somos.png" class="img-thumbnail" width="100" height="70"class="d-inline-block align-text-top"></h1>
			<div class="divider-custom">
               <div class="divider-custom-line"></div>
                <div class="divider-custom-line"></div>
            </div><br>
		    <div class="row justify-content-center">
            <!-- Contenedor 1-->
            <div class="col-md-0 col-lg-2 mb-0">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1" >
                    
                    <h5 class="text-center" >NELSON CRIOLLO</h5>
                    <img class="img-fluid" src="img/icoHombre.png" alt="Imagen no encontrada"/>
                </div>
            </div>
            
            <!-- Contenedor 2-->
            <div class="col-md-0 col-lg-2 mb-0">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
                   
                    <h5 class="text-center">EDITH FLORES</h5>
                    <img class="img-fluid" src="img/icoMujer.png" alt="Imagen no encontrada"/>
                </div>
            </div>
            <!-- Contenedor 3-->
            <div class="col-md-0 col-lg-2 mb-0">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
                   
                    <h5 class="text-center">ALFREDO SOTO</h5>
                    <img class="img-fluid" src="img/icoHombre.png" alt="Imagen no encontrada"/>
                </div>
            </div>
            <!-- Contenedor 4-->
            <div class="col-md-0 col-lg-2 mb-0">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
                    
                    <h5 class="text-center">FRANCO CHAVEZ</h5>
                    <img class="img-fluid" src="img/icoHombre.png" alt="Imagen no encontrada"/>
                </div>
            </div>
             <!-- Contenedor 5-->
            <div class="col-md-0 col-lg-2 mb-0">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal5">
                    
                    <h5 class="text-center">JORGE CHAVEZ</h5>
                    <img class="img-fluid" src="img/icoHombre.png" alt="Imagen no encontrada"/>
                </div>
            </div>
             <!-- Contenedor 6-->
            <div class="col-md-0 col-lg-2 mb-0">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                 
                    <h5 class="text-center">EDUARDO ROJAS</h5>
                    <img class="img-fluid" src="img/icoHombre.png" alt="Imagen no encontrada"/>
                </div>
            </div>
            </div>
            </div>
    		</section>
           <!-- Portfolio Modal 1--> 
         <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
        <div class="modal-dialog modal-x">
            <div class="modal-content">
                <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                <div class="modal-body text-center pb-5">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Nelson Criollo</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-4"> Mi nombre es Nelson Criollo y actualmente me encuentro cursando el cuarto ciclo de la carrera de "Computación e Informática" 
												en el instituto Cibertec. Mi hobbie es la tecnología y programación. Una de mis metas es ser un gran programador y poder 
												desempeñarme en diferentes campos de la tecnología aplicando los conocimientos obtenido durantes todos mis años de estudio. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio Modal 2-->
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
        <div class="modal-dialog modal-x">
            <div class="modal-content">
                <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                <div class="modal-body text-center pb-5">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Edith Flores</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-4">Mi nombre es Edith Flores y actualmente me encuentro cursando el cuarto ciclo de la carrera de "Computación e Informática" 
												en el instituto Cibertec. Mi hobbie es la programación de videojuegos. Una de mis metas es ser una gran programadora y poder 
												desempeñarme en diferentes campos de la tecnología aplicando los conocimientos obtenido durantes todos mis años de estudio. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio Modal 3-->
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
        <div class="modal-dialog modal-x">
            <div class="modal-content">
                <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                <div class="modal-body text-center pb-5">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Alfredo Soto</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-4">Mucho gusto mi nombre es Alfredo Soto actualmente me encuentro cursando el cuarto ciclo de la carrera de Computación e Informática en el prestigioso
												instituto Cibertec hace muchos años tuve también el placer de haber cursado la carrera de Periodismo en la Universidad Jaime Bausate y Meza y a pesar de
												no haber podido terminar dicha carrera me siento muy identificado con las letras; soy un gran amante de la lectura, del deporte, la música, el cine e incluso
												los videojuegos. "De todo un poco" es una frase que sintetiza muy bien mi personalidad.</p>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio Modal 4-->
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
        <div class="modal-dialog modal-x">
            <div class="modal-content">
                <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                <div class="modal-body text-center pb-5">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Franco Chavez</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-4">Me llamo Franco Chávez y soy estudiante del instituto Cibertec de la carrera de Computación e Informática, cursando actualmente el cuarto ciclo. 
												En mis ratos libres me gusta jugar fútbol y cantar. Mi meta principal es poder terminar mi carrera y desempeñarme de la mejor manera 
												en el puesto que me asignen. </p>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <!-- Portfolio Modal 5-->
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" aria-labelledby="portfolioModal5" aria-hidden="true">
        <div class="modal-dialog modal-x">
            <div class="modal-content">
                <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                <div class="modal-body text-center pb-5">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Jorge Chavez</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-4"> Me llamo Jorge Chávez y soy estudiante del instituto Cibertec de la carrera de Computación e Informática, cursando actualmente el cuarto ciclo. 
												En mis ratos libres me gusta jugar fútbol y hacer música. Mi meta principal es poder terminar mi carrera y desempeñarme de la mejor manera 
												en el puesto que me asignen.</p>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <!-- Portfolio Modal 6-->
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" aria-labelledby="portfolioModal6" aria-hidden="true">
        <div class="modal-dialog modal-x">
            <div class="modal-content">
                <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                <div class="modal-body text-center pb-5">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <!-- Portfolio Modal - Title-->
                                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Eduardo Rojas</h2>
                                <!-- Icon Divider-->
                                <div class="divider-custom">
                                    <div class="divider-custom-line"></div>
                                    <div class="divider-custom-line"></div>
                                </div>
                               
                                <!-- Portfolio Modal - Text-->
                                <p class="mb-4">Me llamo Eduardo Rojas y soy estudiante de cuarto ciclo de la carrera de Computación e Informática en el instituto Cibertec.
												En mis ratos libres me gusta escuchar música. Mi meta principal es poder terminar mi carrera y aplicar mis conocimientos en programación adquiridos
												a lo largo de todos estos años. </p>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
		    <!-- Mision -->
			<div class="row justify-content-center" >
			  <div class="card mb-5" style="max-width: 1000px;">
			  <div class="row g-0">
			    <div class="col-md-4">
			      <img src="img/mision.png" class="img-fluid rounded-start" alt="...">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body" >
			        <h5 class="card-title">Mision</h5>
			        <p class="card-text">"Somos un organismo autónomo del Estado cuyos objetivos principales son la defensa de la legalidad, 
										de los derechos ciudadanos y de los intereses públicos; la representación de la sociedad en juicio, para los efectos 
										de defender a la familia, a los menores e incapaces y el interés social, así como para velar por la moral pública; 
										la persecución del delito y la reparación civil.".</p>
											      
			        </div>
			      </div>
			    </div>
			  </div>
			</div>	
		 <!-- Vision -->
		<div class="row justify-content-center">
		  <div class="card mb-5" style="max-width: 1000px;">
			 <div class="row g-0">
			    <div class="col-md-4">
			      <img src="img/vision.png" class="img-fluid rounded-start" alt="...">
			    </div>
			  <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">Vision</h5>
			        <p class="card-text">"Nuestra visión es convertirnos en el ente fiscalizador por excelencia previniendo el delito en todas sus formas
										ciñendonos siempre dentro de los márgenes de la ley y actuando de oficio a instancia de la parte agraviada o por acción
										popular, si se trata de un delito de comisión inmediata."</p>
			        
			      </div>
		       </div>
		     </div>
		   </div>
		</div>				
	
	<jsp:include page="footer.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- JS para validación-->
<script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script>
		var popoverTriggerList = [].slice.call(document
				.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})
	</script>
<script>
</script>
	

</body>
</html>
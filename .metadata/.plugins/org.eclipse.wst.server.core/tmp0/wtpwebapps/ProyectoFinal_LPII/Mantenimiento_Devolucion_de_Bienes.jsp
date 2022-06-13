
<jsp:include page="header.jsp"/>
<div id="principal" class="container">
	<div class="row mx-5 my-4">
		<div class="col-md-6 text-center p-5 lh-sm">

			<h5 class="fw-bold">Registro de Devolución de Bienes</h5>
			<p>Av Abancay cuadra. 5 S/N, Lima,Perú</p>
			<p>Telf: 990990215 - 989435229</p>
		</div>

		<div class="col-md-4 text-center p-3 lh-sm border border-secondary">
			<h3>RUC:20401381291</h3>
			<h3>FICHA DE DEVOLUCIÓN</h3>
			<div class="row">
				<div class=" mb-2 row g-3 d-flex justify-content-center mr-3">
					<div class="col-auto">
						<label for="inputPassword6" class="col-form-label">NRO:</label>
					</div>
					<div class="col-auto">
						<input type="text" id="inputPassword6" class="form-control"
							aria-describedby="passwordHelpInline">
					</div>

				</div>
				
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>

	<div class="row">
		<h3>Datos de Registro de Devoluciones</h3>
		<form class="form-horizontal border border-secondary">
			<div class="row p-3">
				<div class="col-md-10 col-12">
					<div class="row">
						<div class="col-md-6 col-12">
							<div class="row my-1">
								<label for="txtFechaDevolucion" class=" col-6 col-form-label">Fecha
									de Devolución</label>
								<div class="col-6">
									<input type="date" id="txtFechaDevolucion" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-md-6 col-12">
							<div class="row my-1">
								<label for="mpDepartamento" class="col-6 col-form-label">Remitente</label>
								<div class="col-6">
									<select id="mpDepartamento" class="form-select">
										<option selected>Seleccionar</option>
										<option></option>
										<option></option>
										<option></option>
									</select>
								</div>

							</div>

						</div>

					</div>
					
					<div class="row">
						<div class="col-md-6 col-12">
							<div class="row my-1">
								<label for="txtProveedor" class=" col-6 col-form-label">Proveedor</label>
								<div class="col-6">
									<select id="txtProveedor" class="form-select">
										<option selected>Seleccionar</option>
										<option></option>
										<option></option>
										<option></option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="col-md-6 col-12">
							<div class="row my-1">
								<label for="mpDepartamento" class="col-6 col-form-label">Total
									crédito adeudado</label>
								<div class="col-6">
									<input type="text" id="mpDepartamento" class="form-control">
								</div>

							</div>

						</div>


					</div>
				</div>
				<div class="col-md-2 col-12">
					<div class="row my-1">
						<div class="col-lg-12 d-grid">
							<button class="btn btn-dark" type="submit">Nuevo</button>
						</div>

					</div>
					<div class="row my-1">
						<div class="col-lg-12 d-grid">
							<button class="btn btn-dark" type="submit">Grabar</button>
						</div>

					</div>
				</div>
			</div>



		</form>
	</div>


	<div class="row mt-3">
		<table id="TablaDevolucionBienes" class="table table-striped">
			<thead>
				<tr class="table-success">
					<th scope="col">Num. de Devolución</th>
					<th scope="col">Fecha de Devolución</th>
					<th scope="col">Proveedor</th>
					<th scope="col">Remitente</th>
					<th scope="col">Total de Devolución</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><i class="bi bi-trash-fill" style="font-size: 1.2rem;"></i>
						<button class="btn btn-secondary float-end mx-1">Eliminar</button>
						<button class="btn btn-secondary float-end mx-1">Actualizar</button>
						<button class="btn btn-secondary float-end mx-1">Generar detalle</button></td>
			</tbody>
		</table>
	</div>
</div>


				<!-- INICIO - Modal EDITAR-->
				<div class="modal fade" id="modalMantenimientoDevolucionBienes" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">SUPERVISOR</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <form id="formDocente" method="post" action="ServletSupervisor">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Num. de Devolución</label>
						    <input type="text" class="form-control" id="cod_supervisor" name="codigo" readonly>
						  </div>
						  <div class="form-group">
						    <label for="idDescripcion">Fecha de Devolución	</label>
						    <input type="text" class="form-control" id="nom_supervisor" readonly>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Proveedor</label>
						    <input type="text" class="form-control" id="ape_supervisor" readonly>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Remitente</label>
						    <input type="text" class="form-control" id="dni_supervisor" readonly>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Total de Devolución	</label>
						    <input type="text" class="form-control" id="num_hijos" readonly>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Sucursal</label>
						    <select class="form-control" name="condicion" id="idEditarSucursal">
						      <option value=" ">[Seleccione Sucursal]</option>
						    </select>
						  </div>				  
						  
						  <div class="modal-footer">
					      	<button type="submit" class="btn btn-primary">Eliminar</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					      </div>
						</form>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- FIN - Modal PARA EDITAR-->		
		





<jsp:include page="footer.jsp"/>
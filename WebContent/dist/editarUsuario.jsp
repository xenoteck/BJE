<%@page import="model.entidad.Rol"%>
<%@page import="model.entidad.Restaurante"%>
<%@page import="model.ejb.RestauranteEJB"%>
<%@page import="model.ejb.RolEJB"%>
<%@page import="model.entidad.Usuario"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//recupero el usuario de la sesion
	HttpSession sesion = request.getSession(true);
	Usuario userNav = (Usuario) sesion.getAttribute("user");

	//comprueba que este en modo trabajo
	int modoTrabajo;
	try {
		modoTrabajo = (int) sesion.getAttribute("modoTrabajo");

	} catch (Exception e) {
		modoTrabajo = 0;
	}

	//comprueba que el usuario sea valido
	if (userNav == null || userNav.getId() == 0 && userNav.getRol() == 0) {
		response.sendRedirect("Main");
	} else {

		// Si el modo trabajo es 1 es que el modo trabajo esta activado y redirige al
		// jsp del modo trabajo
		if (modoTrabajo == 1) {
			RequestDispatcher rs = getServletContext().getRequestDispatcher("/dist/indexTrabajo.jsp");
			rs.forward(request, response);
		} else {

			if (userNav.getRol() == 1) {
				RequestDispatcher rs = getServletContext().getRequestDispatcher("/dist/indexUsuario.jsp");
				rs.forward(request, response);
			} else if (userNav.getRol() == 2 || userNav.getRol() == 3) {

				Usuario userEdit = (Usuario) sesion.getAttribute("usuarioEditar");

				RolEJB rolEJB = new RolEJB();
				RestauranteEJB restauranteEJB = new RestauranteEJB();
				
				//guarda los parametros en variables
				String correo = userEdit.getCorreo();
				String nombre = userEdit.getNombre();
				String apellido = userEdit.getApellido();
				String activo = (userEdit.isActivo() == true) ? "checked" : "";
				String observaciones = (userNav.getObservaciones() == null) ? "" : userNav.getObservaciones();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Edita Usuario</title>
<link href="dist/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="index.html">Better Job Environment</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="Perfil">Perfil</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="Login?logout=1">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!-- INICIO DE LA BARRA LATERAL -->
						<div class="sb-sidenav-menu-heading">Inicio</div>

						<a class="nav-link" href="Main"><div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Home</a> <a class="nav-link" href="ModoTrabajo"><div
								class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Activar Modo Trabajo</a> <a class="nav-link" href="Login?logout=1"><div
								class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Log Out</a>
					</div>
				</div>
				<!-- INICIO DE LA INFORMACION DEL USUARIO -->

				<div class="sb-sidenav-footer">
					<div class="small">
						Logged in as:
						<%
						//Muestro el nombre del usuario o en caso contrario Muestro el nombre estandar
									if (userNav == null) {
										out.print("Usuario");
									} else {
										out.print(userNav.getNombre());

									}
					%>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Editar
										Cuenta</h3>
								</div>
								<div class="card-body">
									<form action="EditarUsuario" method="POST" id="usrform">
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputFirstName">Nombre</label><input
														class="form-control py-4" name="nombre"
														id="inputFirstName" type="text" placeholder="Nombre"
														value="<%out.print(nombre);%>" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputLastName">Apellido</label><input
														class="form-control py-4" name="apellido"
														id="inputLastName" type="text" placeholder="Apellido"
														value="<%out.print(apellido);%>" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputEmailAddress">Email</label><input
												class="form-control py-4" name="correo"
												id="inputEmailAddress" type="email"
												aria-describedby="emailHelp" placeholder="Email"
												value="<%out.print(correo);%>" />
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<label>Restaurante</label> <select class="selectpicker"
													name="restaurante">
													<%
														String html = "";
																	ArrayList<Restaurante> restaurantes = restauranteEJB.busquedaRestaurantes();

																	//guarda los restaurantes en selectores
																	for (Restaurante r : restaurantes) {

																		html += "<option value='" + r.getId() + "'>" + r.getNombre() + "</option>";

																	}

																	out.print(html);
													%>
												</select>

											</div>
											<div class="col-md-6">
												<label>Rol</label> <select class="selectpicker" name="rol">
													<%
														String htmlRol = "";
																	ArrayList<Rol> roles = rolEJB.busquedaRoles();

																	//Guarda los roles en el selector
																	for (Rol r : roles) {

																		htmlRol += "<option value='" + r.getId() + "'>" + r.getNombre() + "</option>";

																	}

																	out.print(htmlRol);
													%>
												</select>
											</div>

											<div class="col-md-6">
												<label>Activo</label> <input type="checkbox" id="activo"
													name="activo" value="activo" <%out.print(activo);%>>
											</div>

										</div>
										<div class="form-row">
											<textarea style="width: 100%;" name="observaciones"
												form="usrform">
												<%
													out.print(userEdit.getObservaciones());
												%>
											</textarea>
										</div>
										<div class="form-group mt-4 mb-0">
											<input type="submit" class="btn btn-primary btn-block"
												value="Editar" />
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Better Job
							Environment 2020</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="dist/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="dist/assets/demo/chart-area-demo.js"></script>
	<script src="dist/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="dist/assets/demo/datatables-demo.js"></script>
</body>
</html>
<%
	} else {
				response.sendRedirect("Main");
			}
		}
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.entidad.Usuario"%>


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
	
	
	if (userNav.getRol() == 1) {
		response.sendRedirect("Main");
	} 
	//comprueba que este en modo trabajo
	else if(modoTrabajo == 1 && userNav.getRol() == 2 || modoTrabajo == 1 && userNav.getRol() == 3) {
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
<title>Desactivar Modo Trabajo</title>
<link href="dist/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Desactivar
										Modo Trabajo</h3>
								</div>
								<div class="card-body">

									<!-- EMPIEZA EL FORM -->
									<form method="POST" action="ModoTrabajo">
										<div class="form-group">
											<label class="small mb-1" for="inputPassword">Password</label><input
												class="form-control py-4" id="inputPassword" type="password"
												placeholder="Enter password" name="pass" />
										</div>
										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<input type="submit" class="btn btn-primary"
												value="Comprobar"></input>
										</div>
									</form>
								</div>
								<div class="card-footer text-center"></div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
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
</body>
</html>
<%
	}else{
		response.sendRedirect("Main");
	}
%>

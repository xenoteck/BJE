package controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ejb.FacturaEJB;

/**
 * Servlet implementation class VerFactura
 */
@WebServlet("/VerFactura")
public class VerFactura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@EJB
	FacturaEJB facturaEJB;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		response.getWriter().print(facturaEJB.facturaPorId(1).getFecha());
		response.getWriter().println(facturaEJB.getFacturas().get(0).getFecha());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

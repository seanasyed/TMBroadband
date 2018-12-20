import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EQUniform")
public class EQUniformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String field = request.getParameter("field"); 
		
		if (field.equals("authenticate")) {
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			
			if (username.equals("EQUniform") && password.equals("fuckFreshmen34!")) {
				; 
			} else {
				
			}
		}
	}

	
}
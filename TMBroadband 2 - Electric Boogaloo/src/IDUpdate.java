

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IDUpdate
 */
@WebServlet("/IDUpdate")
public class IDUpdate extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IDUpdate() {
        super();
        
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter writer = new PrintWriter("/Users/seansyed/Documents/Code/TMBroadband/TMBroadband "
				+ "2 - Electric Boogaloo/WebContent/input.txt");
		writer.print(request.getParameter("id"));
		writer.close();
		
	}

}

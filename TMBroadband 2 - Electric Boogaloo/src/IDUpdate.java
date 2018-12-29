

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
	private String currID = ""; 
       
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
		
		System.out.println("Servlet called"); 
		//Writes the new ID value to input.txt. May not be necessary after new polling implementation
//		PrintWriter writer = new PrintWriter("/Users/seansyed/Documents/Code/TMBroadband/TMBroadband "
//				+ "2 - Electric Boogaloo/WebContent/input.txt");
//		writer.print(request.getParameter("id"));
//		writer.close();
		
		if (request.getParameter("set") != null) {
			currID = request.getParameter("id"); 
			System.out.println(currID);
		} else {
			System.out.println("Sending " + "{\"id\":\"" + currID + "\"}");
			PrintWriter out = response.getWriter(); 
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print("{\"id\":\"" + currID + "\"}");
			out.flush(); 
		}
		
	}

}

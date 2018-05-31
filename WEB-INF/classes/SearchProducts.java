import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import sdsu.*;

public class SearchProducts extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String search = request.getParameter("search");
        String query = "SELECT vendor.name, vendorModel, retail, image, quantity,sku FROM product join vendor on venID =id where description like '%"+search+"%' or vendor.name like '%"+search+"%';";
        String result = DBHelper.doQuery(query);   

        request.setAttribute("searchResults", result);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp_files/search.jsp");
        dispatcher.forward(request, response);
    }
}
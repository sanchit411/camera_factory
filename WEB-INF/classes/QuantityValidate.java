/*
* Sanchit Arora
* jadrn057
* Project #2
* Spring 2018
*/


import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import sdsu.*;


public class QuantityValidate extends HttpServlet {
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException
    {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String query = request.getParameter("query");
    out.print(query);
    String result = DBHelper.runQuery(query);   
    out.print("ss"+result);
    }
}

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import sdsu.*;

public class PRoductsFilter extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // String query = buildQuery(request);
        // String result = DBHelper.doQuery(query);
        // out.print(result);
        out.print("Received");
    }

    // Build the query that will be executed
    private String buildQuery(HttpServletRequest request) {
        boolean categoryValueExists = false;
        boolean vendorValueExists = false;
        Enumeration<String> keys = request.getParameterNames();
        StringBuffer buffer = new StringBuffer("SELECT sku, manufactuerID, description, quantity, retail, vendor.name");
        // String query = "SELECT sku, manufactuerID, description, quantity, retail, vendor.name";

        if (request.getParameterValues("category").length > 0) {
            categoryValueExists = true;
        }
        if (request.getParameterValues("vendor").length > 0) {
            vendorValueExists = true;
        }

        if (categoryValueExists) {
            buffer.append(", category.name");
            // query += ", category.name";
        }
        buffer.append(" FROM product, vendor");
        // query += " FROM product, vendor";

        if (categoryValueExists) {
            buffer.append(", category");
        }
        buffer.append(" WHERE product.venID = vendor.id");
        // query += " WHERE product.venID = vendor.id";

        if (categoryValueExists) {
            buffer.append(" AND product.catID = category.id");
        }

        while (keys.hasMoreElements()) {
            String parameter = keys.nextElement();
            switch (parameter) {
                case "category":
                    // Break if no values associated with parameter
                    if (!categoryValueExists) {
                        break;
                    }
                    buffer.append(" AND (");
                    for (String value : request.getParameterValues("category")) {
                        buffer.append(" category.name='" + value + "' OR");
                    }

                    // Delete the " OR" at the end and close out the parentheses
                    buffer.delete(buffer.length(), buffer.length() - 3);
                    buffer.append(")");
                    break;

                case "vendor":
                    // Break if no values associated with parameter
                    if (!vendorValueExists) {
                        break;
                    }
                    buffer.append(" AND (");
                    for (String value : request.getParameterValues("vendor")) {
                        buffer.append(" vendor.name='" + value + "' OR");
                    }

                    // Delete the " OR" at the end and close out the parentheses
                    buffer.delete(buffer.length(), buffer.length() - 3);
                    buffer.append(")");
                    break;

                case "price":
                    // Break if no values associated with parameter
                    if (! (request.getParameterValues("price").length > 0) ) {
                        break;
                    }
                    buffer.append(" AND (");
                    for (String value : request.getParameterValues("price")) {
                        if (value.equals("0-25")) {
                            buffer.append(" retail BETWEEN 0 AND 25 OR");
                        }
                        else if (value.equals("25-50")) {
                            buffer.append(" retail BETWEEN 25 AND 50 OR");
                        }
                        else if (value.equals("50-100")) {
                            buffer.append(" retail BETWEEN 50 AND 100 OR");
                        }
                        else if (value.equals("100+")) {
                            buffer.append(" retail >= 100 OR");
                        }
                    }

                    // Delete the " OR" at the end and close out the parentheses
                    buffer.delete(buffer.length(), buffer.length() - 3);
                    buffer.append(")");
                    break;

                case "availability":
                    // Break if no values associated with parameter
                    if (! (request.getParameterValues("availability").length > 0) ) {
                        break;
                    }

                    buffer.append(" AND (");
                    for (String value : request.getParameterValues("availability")) {
                        if (value.equals("instock")) {
                            buffer.append(" quantity = 0 OR");
                        }
                        else if (value.equals("comingsoon")) {
                            buffer.append(" quantity > 0 OR");
                        }
                    }
                    // Delete the " OR" at the end and close out the parentheses
                    buffer.delete(buffer.length(), buffer.length() - 3);
                    buffer.append(")");

                    break;
                default:
                    break;
            }
        }
        buffer.append(";");
        return buffer.toString();
    }
}

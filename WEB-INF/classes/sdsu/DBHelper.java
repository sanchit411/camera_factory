package sdsu;

import java.sql.*;
import java.util.*;

public class DBHelper implements java.io.Serializable {
    private static String connectionURL = "jdbc:mysql://opatija:3306/jadrn057?user=jadrn057&password=jeer" ;               
    private static Connection connection = null;
    private static Statement statement = null;
    private static ResultSet resultSet = null;
    private static int result;
    private static ResultSet resultSet3 = null;
    public DBHelper() {}  

   
    public static String runQuery(String s) {
        String answer = "";
        String qty ="";
         
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            resultSet3 = statement.executeQuery(s);        
            ResultSetMetaData rsmd = resultSet3.getMetaData();
            while(resultSet3.next()){
                qty = resultSet3.getString(rsmd.getColumnName(1));
            }
            answer = qty; 
 
        }  
        catch(Exception e) {
            e.printStackTrace();
        }
            //////////////////////////////////////////////////////////////////////////            
            // The finally clause always runs, and closes resources if open.
            // DO NOT OMIT THIS!!!!!!
            finally {
                try {
                    if(resultSet3 != null)
                        resultSet3.close();
                    if(statement != null)
                        statement.close();
                    if(connection != null)                   
                        connection.close();
                    }
                catch(SQLException e) {
                    answer += e;
                    }
            //////////////////////////////////////////////////////////////////////////
            }
            return answer;
    }

    public static String updateQuery(String s) {
        String answer = "";
         
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            result = statement.executeUpdate(s);        
            answer += result;  
        }  
        catch(Exception e) {
            e.printStackTrace();
        }
            //////////////////////////////////////////////////////////////////////////            
            // The finally clause always runs, and closes resources if open.
            // DO NOT OMIT THIS!!!!!!
            finally {
                try {
                    if(statement != null)
                        statement.close();
                    if(connection != null)                   
                        connection.close();
                    }
                catch(SQLException e) {
                    answer += e;
                    }
            //////////////////////////////////////////////////////////////////////////
            }
            return answer;
    }                      
    
    public static String doQuery(String s) {
            String answer = "";
            String vendor = "";
            String model = "";
            String image = "";
            String retail = "";
            String sku = "";
            // get quantity and only show add to cart button if qty is greater than 0
            String qty = "";		
	    try {
            System.out.println(s);
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL);
		statement = connection.createStatement();
		resultSet = statement.executeQuery(s);
        ResultSetMetaData rsmd = resultSet.getMetaData();                
		while(resultSet.next()) {
                    int columns = rsmd.getColumnCount();

                    vendor = resultSet.getString(rsmd.getColumnName(1));
                    model  = resultSet.getString(rsmd.getColumnName(2));
                    retail = resultSet.getString(rsmd.getColumnName(3));
                    image = resultSet.getString(rsmd.getColumnName(4));
                    qty = resultSet.getString(rsmd.getColumnName(5));
                    sku = resultSet.getString(rsmd.getColumnName(6));
                    
                    
                    
                    answer += "<div class=\"card card-size float-left\">\n";
                    answer += "<img   src=\"http://jadran.sdsu.edu/~jadrn057/proj1/design/" + image +"\" alt= \"" + image + "\"" + ">\n";
                    answer += "<div class='card-body '>\n"+"<h4 class='card-title'>"+vendor+"</h4>";
                    answer += "<p class='card-text'>"+model+"<br /><strong>$"+retail+"</strong>";
                    // if qty == 0 then coming soon
                    if( qty.equals("0")){
                        answer += "<br /><span class='error'id=\"coming-soon\">Coming Soon</span></p>";
                    } else {
                        answer += "<br /><span class='stock'id='stock'>In Stock</span></p>";
                        answer += "<button id='"+sku+"'value='Add To Cart'\n"+ "class='btn btn-primary buy' />Add To Cart</button>\n";
                    }
                    answer += "</div></div>\n";                                                                                 
		    }
                     
		}
		catch(Exception e) {
			e.printStackTrace();
			return e.toString();
			}
        //////////////////////////////////////////////////////////////////////////            
        // The finally clause always runs, and closes resources if open.
        // DO NOT OMIT THIS!!!!!!
        finally {
            try {
                if(resultSet != null)
                    resultSet.close();
                if(statement != null)
                    statement.close();
                if(connection != null)                   
            	    connection.close();
                }
            catch(SQLException e) {
                answer += e;
                }
        //////////////////////////////////////////////////////////////////////////
        }
        return answer;
    }

    public static String doQuerySingle(String s) {
            String answer = "";
            String sku = "";
            String category = "";
            String vendor = "";
            String model = "";  
            String description = "";
            String features = "";
            String retail ="";
            String image = "";
            // get quantity and only show add to cart button if qty is greater than 0
            String quantity = "";

        try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();
        resultSet = statement.executeQuery(s);
                ResultSetMetaData rsmd = resultSet.getMetaData();                
        while(resultSet.next()) {
                    int columns = rsmd.getColumnCount();

                    sku = resultSet.getString(rsmd.getColumnName(1));
                    category  = resultSet.getString(rsmd.getColumnName(2));
                    vendor = resultSet.getString(rsmd.getColumnName(3));
                    model = resultSet.getString(rsmd.getColumnName(4));
                    description = resultSet.getString(rsmd.getColumnName(5));
                    features = resultSet.getString(rsmd.getColumnName(6));
                    retail = resultSet.getString(rsmd.getColumnName(7));
                    quantity = resultSet.getString(rsmd.getColumnName(8));
                    image = resultSet.getString(rsmd.getColumnName(9));
                    answer += "<div class='card mb-3'>\n";

                        answer += "<img class='card-img-top' src=\"http://jadran.sdsu.edu/~jadrn057/proj1/design/" + image +"\" alt= \"" + image + "\"";
                        answer += "<div class='body'>";
                        answer += "<h2 class='card-title' id='title'>" + vendor + " " + model +"</h2>\n";
                        answer += "<p id='price' class='card-text money'> Price: $ "+retail+"</p>";
                        answer += "<br />\n";                                                                                                     

                        if( quantity.equals("0")){
                            answer += "<p class=\"card-text error\">Coming Soon</p>";
                         } else {
                            answer += "<p id='qty_"+sku+"' class=' card-text stock'>Available :"+quantity+"</p>";
                            answer += "<select class='custom select quantity' id='item_"+sku+"'>\n<option selected value='1'>1</option>\n";
                            for (int i=2;i<=Integer.parseInt(quantity);i++){
                                answer += "<option value='"+i+"'>"+i+"</option>";
                            }
                            answer += "</select>";
                            answer += "<button id='"+sku+"'value='"+image+ "' name='"+retail+"' class='btn btn-primary buy' />Add To Cart</button>\n";;
                        }
                         
                    
                    
                    answer += "<div class='card-title'>\n";
                    answer += "<h3>Description</h3>\n";
                    answer += "</div>\n";
                    answer += "<p  class='card-text product-detail'>" + description +"</p>\n";

                    answer += "<div class='card-title'>\n";
                    answer += "<h4>Features</h4>\n";
                    answer += "</div>\n";
                    answer += "<p class='card-text'><small class='text-muted'>" + features +"</small></p>\n";
                    answer += "<br/>";
                    answer += "</div></div>\n"; 
            }                    
        }
        catch(Exception e) {
            e.printStackTrace();
            return e.toString();
            }
        //////////////////////////////////////////////////////////////////////////            
        // The finally clause always runs, and closes resources if open.
        // DO NOT OMIT THIS!!!!!!
        finally {
            try {
                if(resultSet != null)
                    resultSet.close();
                if(statement != null)
                    statement.close();
                if(connection != null)                   
                    connection.close();
                }
            catch(SQLException e) {
                answer += e;
                }
        //////////////////////////////////////////////////////////////////////////
        }
        return answer;
    }
}            
	
	

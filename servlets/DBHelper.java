package sdsu;

import java.sql.*;
import java.util.*;

public class DBHelper implements java.io.Serializable {
    // FIELDS
    private static String connectionURL = "jdbc:mysql://opatija:3306/jadrn025?user=jadrn025&password=severe";
    private static Connection connection = null;
    private static Statement statement = null;
    private static ResultSet resultSet = null;

    // EMPTY CONSTRUCTOR
    public DBHelper() {
    }

    // sku, manufacturer id, quantity, price, and description (cut off by having max length)
    // Get full product description, which passes the results to a jsp file, will include
    // the sku, manufactuer id, description, features, price, quantity

    /*
        Executes any query passed to the static method and returns a Vector
        of the results for each record or row.
    */
    public static Vector runQuery(String query) {
        String answer = "";
        Vector<String []> answerVector = null;

    	try {
        	Class.forName("com.mysql.jdbc.Driver").newInstance();
        	connection = DriverManager.getConnection(connectionURL);
        	statement = connection.createStatement();
        	resultSet = statement.executeQuery(query);

            ResultSetMetaData rsmd = resultSet.getMetaData();
            answerVector = new Vector<String []>();

    	    while(resultSet.next()) {
                String [] row = new String[rsmd.getColumnCount()];
                for(int i = 0; i < rsmd.getColumnCount(); i++) {
                    row[i] = resultSet.getString(i + 1);
                }
                answerVector.add(row);
    		}
    	}
    	catch(Exception error) {
    	    error.printStackTrace();
    	}

        // The finally clause always runs, and closes resources if open.
        finally {
            try {
                if(resultSet != null) {
                    resultSet.close();
                }
                if(statement != null) {
                    statement.close();
                }
                if(connection != null) {
                    connection.close();
                }
            }
            catch (SQLException error) {
                answer += error;
            }
        }
        return answerVector;
    }

    public static String doQuery(String s) {
        String answer = "";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            resultSet = statement.executeQuery(s);
            ResultSetMetaData rsmd = resultSet.getMetaData();
            answer += "<h2>Results from the database:</h2>\n";
            answer += "<table>\n";

            while(resultSet.next()) {
                int columns = rsmd.getColumnCount();
                answer += "<tr>\n";
                for(int i=1; i <= columns; i++) {
                    answer += "<td>"+rsmd.getColumnName(i) + "</td><td>" + resultSet.getString(rsmd.getColumnName(i)) + "</td>\n";
                }
                answer += "</tr>\n";
            }
            answer += "</table>\n";
        }
        catch(Exception error) {
            error.printStackTrace();
            return error.toString();
        }
        // The finally clause always runs, and closes resources if open.
        finally {
            try {
                if(resultSet != null) {
                    resultSet.close();
                }
                if(statement != null) {
                    statement.close();
                }
                if(connection != null) {
                    connection.close();                    
                }
            }
            catch(SQLException error) {
                answer += error;
            }
       }
       return answer;
   }
}

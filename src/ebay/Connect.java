package ebay;
import java.sql.*;
import javax.servlet.*;
public class Connect {

    public Connection connection() {

        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/jebay";
       
      //  String db = "IE";
        String driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String pass = "";
        try {
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;

    }

    public ResultSet getResult(String query) throws SQLException {
       //System.out.println(query);
        ResultSet result = null;
        Statement stmt = null;
         Connection con =null;
        try {
        Connect c = new Connect();
        con =c.connection();

            stmt = con.createStatement();
            result = stmt.executeQuery(query);
           // if(result.next()){
            //	System.out.println(result.getString(1));
            	
          //  }
                
        } catch (Exception e) {
            e.printStackTrace();
        }
         
        return result;
    }
    public  void dml(String query) throws SQLException {
        //System.out.println(query);
          Connection con =null;
         try {
         Connect c = new Connect();
         con =c.connection();

             PreparedStatement ps=con.prepareStatement(query);
             ps.executeUpdate();
             } catch (Exception e) {
             e.printStackTrace();
         }
             finally{
            	 con.close();
             }
          
      
     }
}


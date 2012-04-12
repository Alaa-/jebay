<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,ebay.Connect" %> 
<%@ page trimDirectiveWhitespaces="true" %>

<%
String connectionURL = "jdbc:mysql://localhost:3306/jebay";

ResultSet rs = null;


Connection con=null;

InputStream sImage;
try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

String id=request.getParameter("item_id");
con= DriverManager.getConnection(connectionURL, "root", "");

Connect c=new Connect();

rs =c.getResult("SELECT image_blob FROM image_details where image_item_id='"+id+"'");
if(rs.next()) {
byte[] bytearray = new byte[1048576];
int size=0;
sImage = rs.getBinaryStream(1);
//response.reset();
response.setContentType("image/jpg");
while((size=sImage.read(bytearray))!= -1 ){
response.getOutputStream().write(bytearray,0,size);
}
}
}
catch(Exception ex){

}
finally {

rs.close();
//psmnt.close();
con.close();
}
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,student.Connect" %> 
<%@ page trimDirectiveWhitespaces="true" %>

<%
String connectionURL = "jdbc:mysql://localhost:3306/studentinfo";

ResultSet rs = null;


Connection con=null;

InputStream sImage;
try {

Class.forName("com.mysql.jdbc.Driver").newInstance();

String id=request.getParameter("id");
con= DriverManager.getConnection(connectionURL, "root", "");

Connect c=new Connect();

rs =c.getResult("SELECT image FROM student where roll='"+id+"'");
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
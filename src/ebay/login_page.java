


package ebay;

/**
 *
 * @author mohit
 */
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.*;
import java.sql.*;

public class login_page  extends ActionSupport{

private String uid;
private String password;

 public String getUid()
    {
    return uid;
}

public void setUid(String uid)
    {
    this.uid=uid;
    }

 public String getPassword()
    {
    return password;
}

public void setPassword(String password)
    {
    this.password=password;
    }

    @Override
    public String execute() throws Exception
    {
         if(getUid().equals(""))
         {
             this.addActionError("Required username");
                    return ERROR;
         }

         if(getPassword().equals(""))
         {
             this.addActionError("Required password");
                    return ERROR;
         }

        try{

                Class.forName("org.gjt.mm.mysql.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ebay","root","");

                Statement stat=con.createStatement();
                String sql;
	        ResultSet rs=null;

                sql= "select * from user_details where user_id='"+getUid()+"' and user_password='"+getPassword()+"'";
                rs = stat.executeQuery(sql);

                 if (rs.next())
                 {
                	if(rs.getInt("ser_cstatus")==0){
                		addActionError("confirm your registration by clicking the confirmation link set to your email");
                		return "unconfirm";
                		
                	}
                    System.out.println("in rs next");
                    Map session=ActionContext.getContext().getSession();
                    session.put("logged-in","true");
                    System.out.println(getUid());
                    session.put("User",getUid());
                 }

                else{
                    this.addActionError("username and password doesn't match");
                    return ERROR;

                 }
                 }


        catch(Exception e)
         {
             System.out.println(e);
         }
         return SUCCESS;
    }


}



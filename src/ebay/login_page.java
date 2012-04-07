


package ebay;

/**
 *
 * @author mohit
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

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
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jebay","root","");

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
                    ServletActionContext.getRequest().getSession().setAttribute("username",getUid());
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



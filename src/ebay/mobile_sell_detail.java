/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ebay;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.*;
import java.sql.*;

/**
 *
 * @author Rohit
 */
public class mobile_sell_detail extends ActionSupport {

     private String mobilename;
     private String mobilebrand;
     private String mobilesn;
     private String simopt;
     private String mobiletype;
     private String networkstandard;
     private String camera;
     private String mobilecondition;
     private String mobilequantity;
     private String mobilebuying;
     private String mobileimage;
     private int mobileprice;
     private int mobilesc;
     private String feature;


    public String getCamera() {
        return camera;
    }

    public void setCamera(String camera) {
        this.camera = camera;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getMobilebrand() {
        return mobilebrand;
    }

    public void setMobilebrand(String mobilebrand) {
        this.mobilebrand = mobilebrand;
    }

    public String getMobilebuying() {
        return mobilebuying;
    }

    public void setMobilebuying(String mobilebuying) {
        this.mobilebuying = mobilebuying;
    }

    public String getMobilecondition() {
        return mobilecondition;
    }

    public void setMobilecondition(String mobilecondition) {
        this.mobilecondition = mobilecondition;
    }

    public String getMobileimage() {
        return mobileimage;
    }

    public void setMobileimage(String mobileimage) {
        this.mobileimage = mobileimage;
    }

    public String getMobilename() {
        return mobilename;
    }

    public void setMobilename(String mobilename) {
        this.mobilename = mobilename;
    }

    public int getMobileprice() {
        return mobileprice;
    }

    public void setMobileprice(int mobileprice) {
        this.mobileprice = mobileprice;
    }

    public String getMobilequantity() {
        return mobilequantity;
    }

    public void setMobilequantity(String mobilequantity) {
        this.mobilequantity = mobilequantity;
    }

    public int getMobilesc() {
        return mobilesc;
    }

    public void setMobilesc(int mobilesc) {
        this.mobilesc = mobilesc;
    }

    public String getMobilesn() {
        return mobilesn;
    }

    public void setMobilesn(String mobilesn) {
        this.mobilesn = mobilesn;
    }

    public String getMobiletype() {
        return mobiletype;
    }

    public void setMobiletype(String mobiletype) {
        this.mobiletype = mobiletype;
    }

    public String getNetworkstandard() {
        return networkstandard;
    }

    public void setNetworkstandard(String networkstandard) {
        this.networkstandard = networkstandard;
    }

    public String getSimopt() {
        return simopt;
    }

    public void setSimopt(String simopt) {
        this.simopt = simopt;
    }


     public String execute() throws Exception
    {
         try{


                Class.forName("org.gjt.mm.mysql.Driver");

                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ebay","root","");
                Statement stat=con.createStatement();
         		String sql;
			String sql1;
		        ResultSet rs=null;
                        int total_price = getMobileprice() + getMobilesc();
                        sql="insert into mobile_details values (null,'"+getMobilebrand()+"','"+getMobilename()+"','"+getSimopt()+"','"+getMobiletype()+"','"+getMobilecondition()+"','"+getNetworkstandard()+"','"+getCamera()+"','"+getMobilebuying()+"','"+getMobilesn()+"','"+getMobilesc()+"',"+getMobilequantity()+",'"+getMobileimage()+"',"+getMobileprice()+","+total_price+",'"+getFeature()+"')";
				System.out.println(sql);
                                stat.executeUpdate(sql);

             }
         catch(Exception e)
        {
            System.out.println(e);
        }
        return SUCCESS;
   }
}

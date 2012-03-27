package ebay;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.*;
public class Confirmation {
private long cid;

public long getCid() {
	return cid;
}

public void setCid(long cid) {
	this.cid = cid;
}
public String execute(){
	try{
		Connect c=new Connect();
		c.dml("update user_details set cstatus=1 where cid='"+cid+"'");
		
		return "success";
	}catch(Exception e){e.printStackTrace();return "fail";}
}
}

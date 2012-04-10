package ebay;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import model.BankDetails;

import org.apache.struts2.ServletActionContext;

import vo.ItemVo;

public class Intermediate {
	String winner;
	ArrayList lstBanks = new ArrayList();


	public ArrayList getLstBanks() {
		return lstBanks;
	}
	public void setLstBanks(ArrayList lstBanks) {
		this.lstBanks = lstBanks;
	}
	
	
	
	public String getWinner() {
		return winner;
	}
	public void setWinner(String winner) {
		this.winner = winner;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public ArrayList<xyz> getArr() {
		return arr;
	}
	public void setArr(ArrayList<xyz> arr) {
		this.arr = arr;
	}
	int item_id;
	ArrayList<xyz> arr=new ArrayList<xyz>();
public String execute()throws Exception{
	lstBanks = BankDetails.getAllBanks();
	Connect c=new Connect();
	HttpSession session=ServletActionContext.getRequest().getSession();
	session.setAttribute("username",winner);
	ResultSet rs=c.getResult("select * from item_details where item_id='"+item_id+"'");
	while(rs.next()){
		xyz x=new xyz();
		ItemVo i=new ItemVo();
		x.setItem_seller(rs.getString("item_seller"));
		x.setItem_name(rs.getString("item_name"));
		Connect c1=new Connect();
		ResultSet rs1=c1.getResult("select * from bidding_details where bidding_item_id='"+item_id+"' and bidding_buyer='"+winner+"'");
		rs1.next();
		System.out.println(rs1.getInt("bidding_bid"));
		x.setItem_price(rs1.getInt("bidding_bid"));
		x.setQuantity(1);
	
		x.setItem_shipping_charge(rs.getInt("item_shipping_charge"));
		x.setItem_total_shipping(rs.getInt("item_shipping_charge")+rs1.getInt("bidding_bid"));
		ResultSet rs2=c.getResult("select * from user_details where user_id='"+winner+"'");
		rs2.next();
		x.setUser_home_address(rs2.getString("user_home_address"));
		x.setUser_city(rs2.getString("user_city"));
		x.setUser_name(rs2.getString("user_first_name")+rs2.getString("user_last_name"));
		x.setUser_state(rs2.getString("user_state"));
		arr.add(x);
		
	}
	
	
	return "success";
}
}




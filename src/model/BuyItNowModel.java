package model;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import vo.ItemVo;
import ebay.Connect;
public class BuyItNowModel {
public ArrayList<ItemVo> getitemdetails(int item_id){
	try{
		ArrayList<ItemVo> arr=new ArrayList<ItemVo>();
		String query="select *,concat('',timediff(item_endtime,current_timestamp))as diff from item_details where item_id='"+item_id+"'";
		Connect c=new Connect();
		ResultSet rs=c.getResult(query);
		while(rs.next()){
			ItemVo it=new ItemVo();
			it.setItem_name(rs.getString("item_name"));
			it.setItem_price(rs.getInt("item_price"));
			it.setItem_condition(rs.getString("item_condition"));
			String diff=rs.getString("diff");
			String[] a=diff.split(":");
			int days=(Integer.parseInt(a[0])/24);
			int hours=0;
			if(days>0){
				hours=Integer.parseInt(a[0])-days*24;
			}
			else{
				hours=Integer.parseInt(a[0]);
			}
			int minutes=Integer.parseInt(a[1]);
			String str=days+"D "+hours+"H "+minutes+"M ";
			it.setItem_endtime(str);
			it.setItem_quantity(rs.getInt("item_quantity"));
			it.setItem_shipping_charge(rs.getInt("item_shipping_charge"));
			it.setItem_seller(rs.getString("item_seller"));
			it.setItem_id(rs.getInt("item_id"));
			int tot = rs.getInt("item_quantity")*rs.getInt("item_price")+rs.getInt("item_shipping_charge");
			String total=Integer.toString(tot);
			System.out.println("total is coming "+total);
			Map session=ActionContext.getContext().getSession();
		    session.put("totalPrice",total);
			arr.add(it);
		}
		
		
		return arr;
	}catch(Exception e){
		return null;
	}
}
}


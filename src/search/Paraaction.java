package search;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import vo.ItemVo;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import ebay.Connect;
public class Paraaction extends ActionSupport{
String condition,mode;
String min,max;
public String getMin() {
	return min;
}

public void setMin(String min) {
	this.min = min;
}

public String getMax() {
	return max;
}

public void setMax(String max) {
	this.max = max;
}
int min1,max1;

ArrayList<ItemVo> arr=new ArrayList<ItemVo>();
public ArrayList<ItemVo> getArr() {
	return arr;
}

public void setArr(ArrayList<ItemVo> arr) {
	this.arr = arr;
}
String globalquery,wherequery;
public String getCondition() {
	return condition;
}

public void setCondition(String condition) {
	this.condition = condition;
}

public String getMode() {
	return mode;
}

public void setMode(String mode) {
	this.mode = mode;
}
@Override
public String execute() throws Exception {
	Map session=ActionContext.getContext().getSession();
	String keyword=session.get("keyword").toString();
	int category=Integer.parseInt(session.get("category").toString());
	if(category==0){
	wherequery="where item_name like '%"+keyword+"%' ";}
	else{
		wherequery="where item_name like '%"+keyword+"%' and item_category_id='"+category+"'";	
	}
	if(condition!=null){
		
		wherequery+="and item_condition='"+condition+"'";
		
	}
if(mode!=null){
		
		wherequery+="and item_mode='"+mode+"'";
		
	}
if(min.length()!=0&&max.length()!=0){
	min1=Integer.parseInt(min);
	max1=Integer.parseInt(max);
	wherequery+="and item_price between '"+min1+"' and '"+max1+"'";
}
Connect c=new Connect();
	globalquery="select * from item_details "+wherequery;
	ResultSet rs=c.getResult(globalquery);
	while(rs.next()){
    	ItemVo i=new ItemVo();
    	i.setItem_id(rs.getInt("item_id"));
    	i.setItem_name(rs.getString("item_name"));
    	if(rs.getString("item_mode").equals("0")){
    		i.setItem_mode("Buy It Now");
    	}else{
    		i.setItem_mode("Bidding");
    	}
    	i.setItem_condition(rs.getString("item_condition"));
    	i.setItem_price(rs.getInt("item_price"));
    	arr.add(i);
    }
	if(arr.size()==0){
		addActionError("NO RESULTS FOUND");
	}
	return "success";
	
}


}

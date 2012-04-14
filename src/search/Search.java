package search;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import vo.ItemVo;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import ebay.Connect;

public class Search extends ActionSupport {
	String keyword;
	int category;
	String subcategory;

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	ArrayList<ItemVo> arr = new ArrayList<ItemVo>();

	public ArrayList<ItemVo> getArr() {
		return arr;
	}

	public void setArr(ArrayList<ItemVo> arr) {
		this.arr = arr;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	@Override
	public String execute() throws Exception {

		keyword = keyword.toLowerCase();
		Connect c = new Connect();
		String query;
		if (category == 0) {
			query = "select *,concat('',timediff(item_endtime,now())) as diff from item_details where item_name like '%"
					+ keyword
					+ "%' and item_mode<>'2' and timediff(item_endtime,now())>0 and item_quantity>0";
			ResultSet rs = c.getResult(query);
			while (rs.next()) {

				ItemVo i = new ItemVo();
				i.setItem_id(rs.getInt("item_id"));
				i.setItem_name(rs.getString("item_name"));
				if (rs.getString("item_mode").equals("0")) {
					i.setItem_mode("Buy It Now");
				} else {
					i.setItem_mode("Bidding");
				}
				i.setItem_condition(rs.getString("item_condition"));
				i.setItem_price(rs.getInt("item_price"));
				String diff = rs.getString("diff");
				String[] a = diff.split(":");
				int days = (Integer.parseInt(a[0]) / 24);
				int hours = 0;
				if (days > 0) {
					hours = Integer.parseInt(a[0]) - days * 24;
				} else {
					hours = Integer.parseInt(a[0]);
				}
				int minutes = Integer.parseInt(a[1]);
				String str = days + "D " + hours + "H " + minutes + "M ";
				i.setItem_endtime(str);
				i.setItem_quantity(rs.getInt("item_quantity"));
				arr.add(i);
			}
		} else {
			query = "select * from category_details where category_id='"
					+ category + "'";
			ResultSet rs1 = c.getResult(query);
			while (rs1.next()) {
				Connect c1 = new Connect();
				String query1 = "select *,concat('',timediff(item_endtime,now())) as diff from item_details where item_category_id='"
						+ rs1.getString("category_id")
						+ "' and item_name like '%"
						+ keyword
						+ "%' and item_mode<>'2' and timediff(item_endtime,now())>0 and item_quantity>0";
				if (subcategory != null) {
					query1 = query1 + " and item_subcategory_id='"
							+ subcategory + "'";
				}
				ResultSet rs2 = c1.getResult(query1+" order by item_price");
				while (rs2.next()) {
					ItemVo i = new ItemVo();
					i.setItem_id(rs2.getInt("item_id"));
					i.setItem_name(rs2.getString("item_name"));
					if (rs2.getString("item_mode").equals("0")) {
						i.setItem_mode("Buy It Now");
					} else {
						i.setItem_mode("Bidding");
					}
					String diff = rs2.getString("diff");
					String[] a = diff.split(":");
					int days = (Integer.parseInt(a[0]) / 24);
					int hours = 0;
					if (days > 0) {
						hours = Integer.parseInt(a[0]) - days * 24;
					} else {
						hours = Integer.parseInt(a[0]);
					}
					int minutes = Integer.parseInt(a[1]);
					String str = days + "D " + hours + "H " + minutes + "M ";
					i.setItem_endtime(str);
					i.setItem_condition(rs2.getString("item_condition"));
					i.setItem_price(rs2.getInt("item_price"));
					i.setItem_quantity(rs2.getInt("item_quantity"));
					arr.add(i);
				}
			}
		}
		Map session = ActionContext.getContext().getSession();
		session.put("keyword", keyword);
		session.put("category", category);
		if(subcategory!=null){
			session.put("subcategory",subcategory);
		}
		if (arr.size() == 0) {
			addActionError("NO RESULTS FOUND FOR GIVEN KEYWORD");
		}
		return "success";
	}
}

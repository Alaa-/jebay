package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import myutil.DB;
import vo.BookVo;

public class Category_Book {

	
	public static ArrayList getBookDetails(String search){
		ArrayList details = new ArrayList();
		
		ResultSet rs = null;
		String strQuery = "select * from book_details";
		Connection conn = DB.getConnection();
		rs = DB.readFromDB(strQuery, conn);
		
		try{
			while(rs.next())
			{
				
				
				String name = rs.getString("name");
				String author = rs.getString("author");
				String department = rs.getString("department");
				//String condition = rs.getString("condition");
				String edition = rs.getString("edition");
				int price = rs.getInt("price");
				String image = rs.getString("image");
				
				BookVo bookVo = new BookVo(name,author,department,edition,price,image);
				details.add(bookVo);
			}
		}
		catch(Exception ex)
		{
			
		}
		return details;
	}
	
	public static ArrayList getCols()
	{
		ArrayList cols=new ArrayList();
		ResultSet rs = null;
		String strQuery = "select * from book_details";
		Connection conn = DB.getConnection();
		rs = DB.readFromDB(strQuery, conn);
		cols=DB.getColumnNames(rs);
		return cols;
	}
}

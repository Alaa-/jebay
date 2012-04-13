package ebay;

import java.io.*;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class loadimage
{
	File image;

	public File getImage()
	{
		return image;
	}

	public void setImage(File image)
	{
		this.image = image;
	}

	public int getItem_id()
	{
		return item_id;
	}

	public void setItem_id(int item_id)
	{
		this.item_id = item_id;
	}

	int item_id;

	public String execute() throws Exception
	{
		Connect c = new Connect();
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jebay", "root", "");
		PreparedStatement ps = con.prepareStatement("insert into image_details(image_item_id,image_blob) values(?,?)");
		ps.setInt(1, item_id);
		FileInputStream fis = new FileInputStream(image);
		ps.setBinaryStream(2, fis, (int) image.length());
		ps.executeUpdate();
		return "success";
	}
}

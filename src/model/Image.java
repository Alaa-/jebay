package model;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import myutil.DB;

public class Image
{
	public static int saveImage(int item_id,File image)
	{
		int result = -1;
		Connection conn;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		String sqlQuery;
		conn = DB.getConnection();
		if (conn == null)
		{
			return result;
		}
		else
		{
			try
			{
				sqlQuery = "insert into image_details(image_item_id,image_blob) values( ?,? ) ";
				pstmt = conn.prepareStatement(sqlQuery);
				pstmt.setInt(1, item_id);
				pstmt.setBinaryStream(2, new FileInputStream(image),(int)image.length());
				pstmt.executeUpdate();
				result = 1;
			}
			catch (Exception ex)
			{
				System.out.println("Error in inserting imagedata");
				ex.printStackTrace();
			}
			finally
			{
				try
				{
					conn.close();
				}
				catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return result;
	}

}

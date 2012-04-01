package myutil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Query
{
	public static ResultSet select(String sqlQuery)
	{
		Connection conn;
		Statement stmt;
		ResultSet rs;
		conn = DB.getConnection();
		if (conn == null)
		{
			return null;
		}
		else
		{
			try
			{
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sqlQuery);
				return rs;
			}
			catch (Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{

			}
			return null;
		}
	}

	public static int Update(String sqlQuery)
	{
		Connection conn;
		Statement stmt;
		int result = -1;
		conn = DB.getConnection();
		if (conn == null)
		{
			return result;
		}
		else
		{
			try
			{
				stmt = conn.createStatement();
				result = stmt.executeUpdate(sqlQuery);
				return result;
			}
			catch (Exception ex)
			{
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
			return -1;
		}
	}
}

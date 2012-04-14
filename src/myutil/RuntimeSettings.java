package myutil;

public class RuntimeSettings
{
	public static final String APPLICATION_NAME = "Store";
	public static final String VERSION_ID = " version 0.1" + " dated October 8, 2011";
	public static final String SERVER_IP = "localhost";
	static String databaseName = "jebay";
	static String dbUserID = "root";
	static String dbPassword = "";
	public static String RUN_MODE = "Test"; // "Test"; // "TestSMS", //
											// "Production"; //
	public static boolean IS_IN_DEBUG_MODE = true; // false; //
	public static int ROWS_IN_PAGE = 10;
	static int portNo = 3306;// 5432; //
	public static String TEST_DIRECTORY = "D:/TaxiManagementDev/test/"; // "D:/working/TaxiManagementNew/test/";
																		// //
																		// "D:/working/GeoSynch/Test/";
	public static String DB_DIRECTORY = "/DB/";
	public static String scriptSql[] = {
			// " drop database if exists store_development;",
			// " create database store_development;",
			" use eby;", "DROP TABLE IF EXISTS users;", "CREATE TABLE  users(" + "id int(10) unsigned NOT NULL AUTO_INCREMENT," + "username varchar(45) NOT NULL," + "password varchar(45) NOT NULL," + "fname varchar(10)," + "lname varchar(10) NOT NULL," + "email varchar(50)," + "phone int(11)," + "created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP," + "PRIMARY KEY (`id`));" };

}

package ebay;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.*;
import java.sql.*;

public class sign_up extends ActionSupport
{

	private String firstname;

	private String lastname;
	private String password;
	private String address1;
	private String address2;
	private String city;
	private String state;
	private String country;
	private String pincode;
	private String phone;
	private String email;
	private String uid;
	private String birthdate;
	private String birthyear;
	private String birthmonth;
	private String secquestion;
	private String secanswer;
	long number;

	public String getFirstname()
	{
		return firstname;

	}

	public void setFirstname(String firstname)
	{
		this.firstname = firstname;
	}

	public String getLastname()
	{
		return lastname;

	}

	public void setLastname(String lastname)
	{
		this.lastname = lastname;
	}

	public String getPassword()
	{
		return password;

	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getAddress1()
	{
		return address1;

	}

	public void setAddress1(String address1)
	{
		this.address1 = address1;

	}

	public String getAddress2()
	{
		return address2;

	}

	public void setAddress2(String address2)
	{
		this.address2 = address2;

	}

	public String getCity()
	{
		return city;

	}

	public void setCity(String city)
	{
		this.city = city;
	}

	public String getState()
	{
		return state;

	}

	public void setState(String state)
	{
		this.state = state;
	}

	public String getCountry()
	{
		return country;

	}

	public void setCountry(String country)
	{
		this.country = country;
	}

	public String getPincode()
	{
		return pincode;

	}

	public void setPincode(String pincode)
	{
		this.pincode = pincode;
	}

	public String getPhone()
	{
		return phone;

	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public String getEmail()
	{
		return email;

	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getUid()
	{
		return uid;

	}

	public void setUid(String uid)
	{
		System.out.println("In setter");
		this.uid = uid;
	}

	public String getBirthdate()
	{
		return birthdate;
	}

	public void setBirthdate(String birthdate)
	{
		this.birthdate = birthdate;
	}

	public String getBirthmonth()
	{
		return birthmonth;
	}

	public void setBirthmonth(String birthmonth)
	{
		this.birthmonth = birthmonth;
	}

	public String getBirthyear()
	{
		return birthyear;
	}

	public void setBirthyear(String birthyear)
	{
		this.birthyear = birthyear;
	}

	public String getSecquestion()
	{
		return secquestion;
	}

	public void setSecquestion(String secquestion)
	{
		this.secquestion = secquestion;
	}

	public String getSecanswer()
	{
		return secanswer;
	}

	public void setSecanswer(String secanswer)
	{
		this.secanswer = secanswer;
	}

	@Override
	public String execute() throws Exception
	{

		try
		{
			System.out.println("In try");
			System.out.println("here in try");
			Class.forName("org.gjt.mm.mysql.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ebay", "root", "");
			Statement stat = con.createStatement();
			String sql;
			String sql1;
			ResultSet rs = null;
			number = (long) Math.floor(Math.random() * 9000000000L) + 1000000000L;
			checkrandom();
			sql = "insert into user_details (user_id,first_name,last_name,home_address,city,state,country,pin_code,phone_no,email,dob,password,secret_question,secret_answer,cstatus,cid) values ('" + getUid() + "','" + getFirstname() + "','" + getLastname() + "','" + getAddress1() + getAddress2() + "','" + getCity() + "','" + getState() + "','" + getCountry() + "','" + getPincode() + "','" + getPhone() + "','" + getEmail() + "','" + getBirthdate() + "-" + getBirthmonth() + "-" + getBirthyear()
					+ "','" + getPassword() + "','" + getSecquestion() + "','" + getSecanswer() + "','0','" + number + "')";

			System.out.println(sql);
			stat.executeUpdate(sql);

			SendMail1 s = new SendMail1();
			s.to = email;
			s.subject = "JEBAY CONFIRMATION LINK";
			s.message = "<a href=\"http://192.16.11.80:8080/Jebay/Confirmation.action?cid=" + number + "\">CLICK HERE </a>TO CONFIRM YOUR JEBAY REGISTRATION";
			s.main();
			Map session = ActionContext.getContext().getSession();
			session.put("logged-in", "true");
			session.put("User", getFirstname());
			System.out.println(getLastname());

		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return SUCCESS;
	}

	public void checkrandom() throws Exception
	{
		Connect c = new Connect();
		ResultSet rs = c.getResult("select * from user_details where cid='" + number + "'");
		if (rs.next())
		{
			number = (long) Math.floor(Math.random() * 9000000000L) + 1000000000L;
			checkrandom();
		}
		else
		{
			return;
		}
	}
}

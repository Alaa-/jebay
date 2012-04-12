package vo;

public class UserDetailsVo {

	String user_home_address,user_city,user_first_name,user_last_name,user_state;

	public UserDetailsVo(String user_home_address, String user_city,
			String user_first_name, String user_last_name, String user_state) {
		super();
		this.user_home_address = user_home_address;
		this.user_city = user_city;
		this.user_first_name = user_first_name;
		this.user_last_name = user_last_name;
		this.user_state = user_state;
	}

	public UserDetailsVo() {
		super();
	}

	public String getUser_home_address() {
		return user_home_address;
	}

	public void setUser_home_address(String user_home_address) {
		this.user_home_address = user_home_address;
	}

	public String getUser_city() {
		return user_city;
	}

	public void setUser_city(String user_city) {
		this.user_city = user_city;
	}

	public String getUser_first_name() {
		return user_first_name;
	}

	public void setUser_first_name(String user_first_name) {
		this.user_first_name = user_first_name;
	}

	public String getUser_last_name() {
		return user_last_name;
	}

	public void setUser_last_name(String user_last_name) {
		this.user_last_name = user_last_name;
	}

	public String getUser_state() {
		return user_state;
	}

	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	
	
}

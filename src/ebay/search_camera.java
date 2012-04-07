package ebay;

import com.opensymphony.xwork2.ActionSupport;

public class search_camera extends ActionSupport{

	private String cam;

	public String execute(){
		System.out.println("item is "+cam);
		return "success";
	}

	public String getCam() {
		return cam;
	}

	public void setCam(String cam) {
		this.cam = cam;
	}

	
	
}

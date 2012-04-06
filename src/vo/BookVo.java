package vo;

public class BookVo {

	String name;
	String author;
	String department;
	String edition;
	int price;
	String image;
	public BookVo(String name, String author, String department,
			String edition, int price, String image) {
		super();
		this.name = name;
		this.author = author;
		this.department = department;
		this.edition = edition;
		this.price = price;
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getEdition() {
		return edition;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}

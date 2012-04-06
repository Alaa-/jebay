package vo;

import java.beans.ConstructorProperties;

public class CameraVo
{
	int category_id;
	String category_name;
	String brand;
	String name;
	String memory;
	String pixel;
	String condition;
	int price;
	String image;

	public CameraVo(String brand, String name, String memory, String pixel,
			int price,String image) {
		//super();
		this.brand = brand;
		this.name = name;
		this.memory = memory;
		this.pixel = pixel;
		//this.condition = condition;
		this.price = price;
		this.image = image;
	}



	public CameraVo() {
		super();
	}


	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	public String getPixel() {
		return pixel;
	}

	public void setPixel(String pixel) {
		this.pixel = pixel;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
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


	public int getCategory_id()
	{
		return category_id;
	}

	public void setCategory_id(int category_id)
	{
		this.category_id = category_id;
	}

	public String getCategory_name()
	{
		return category_name;
	}

	public void setCategory_name(String category_name)
	{
		this.category_name = category_name;
	}


}

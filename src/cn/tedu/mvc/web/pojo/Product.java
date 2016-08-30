package cn.tedu.mvc.web.pojo;

import java.io.Serializable;

public class Product implements Serializable{
	private String productid;
	public String getProductid(){
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Product [productid=" + productid + ", name=" + name + ", description=" + description + ", basePrice="
				+ basePrice + ", author=" + author + ", publish=" + publish + ", pages=" + pages + ", images=" + images
				+ ", categoryid=" + categoryid + "]";
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(double basePrice) {
		this.basePrice = basePrice;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}
	private String name;
	private String description;
	private double basePrice;
	private String author;
	private String publish;
	private int pages;
	private String images;
	private String categoryid;
}

package cn.tedu.mvc.web.action;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionContext;

import cn.tedu.mvc.web.pojo.Contactinfo;
import cn.tedu.mvc.web.service.UserModifyService;

public class UserModifyAction {
	
	private String contactid;
	private String userid;
	private String street1;
	private String street2;
	private String city;
	private String province;
	private String country;
	private String zip;
	private String email;
	private String homephone;
	private String cellphone;
	private String officephone;
	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getStreet1() {
		return street1;
	}
	public void setStreet1(String street1) {
		this.street1 = street1;
	}
	public String getStreet2() {
		return street2;
	}
	public void setStreet2(String street2) {
		this.street2 = street2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHomephone() {
		return homephone;
	}
	public void setHomephone(String homephone) {
		this.homephone = homephone;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getOfficephone() {
		return officephone;
	}
	public void setOfficephone(String officephone) {
		this.officephone = officephone;
	}
	public String getContactid() {
		return contactid;
	}
	public void setContactid(String contactid) {
		this.contactid = contactid;
	}
	private String password;
	public String get(){
		UserModifyService ums = new UserModifyService();
		Contactinfo contactinfo = ums.getInfo(userid);
		ActionContext.getContext().put("contactinfo", contactinfo);

		return "ok";
	}
	public String insert() throws ClassNotFoundException, SQLException{
		UserModifyService ums = new UserModifyService();
		Contactinfo cti = new Contactinfo();
		cti.setCellphone(cellphone);
		cti.setCity(city);
		cti.setCountry(country);
		cti.setEmail(email);
		cti.setHomephone(homephone);
		cti.setOfficephone(officephone);
		cti.setProvince(province);
		cti.setStreet1(street1);
		cti.setStreet2(street2);
		cti.setZip(zip);
		cti.setUserid(userid);
		cti.setPassword(password);
		cti.setUserid(userid);
		
		System.out.println(userid);
		ums.newUser(cti);;
		return "ok";
	}
	
	public String modify() throws ClassNotFoundException, SQLException{
		UserModifyService ums = new UserModifyService();
		Contactinfo cti = new Contactinfo();
		cti.setCellphone(cellphone);
		cti.setCity(city);
		cti.setCountry(country);
		cti.setEmail(email);
		cti.setHomephone(homephone);
		cti.setOfficephone(officephone);
		cti.setProvince(province);
		cti.setStreet1(street1);
		cti.setStreet2(street2);
		cti.setZip(zip);
		cti.setUserid(userid);
		cti.setUsername(username);
		cti.setPassword(password);
		cti.setUserid(userid);
		
		System.out.println(username);
		ums.setUser(cti);
		return "ok";
	}
}

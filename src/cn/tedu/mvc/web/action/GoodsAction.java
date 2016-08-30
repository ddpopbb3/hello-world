package cn.tedu.mvc.web.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import cn.tedu.mvc.web.pojo.Goods;
import cn.tedu.mvc.web.pojo.Users;

public class GoodsAction {
	private String pid;
	private String baseprice;
	private String name;
	private String goodsamount;
	
	
	public String clearGoods(){
		ActionContext.getContext().getSession().put("goodslist", null);
		return "ok";
	}
	
	public String getGoods(){
		if((Users)ActionContext.getContext().getSession().get("user")!=null){
		Goods goods = new Goods();
		goods.setProductid(pid);
		goods.setBaseprice(baseprice);
		goods.setName(name);
		Boolean flag = false;
		List <Goods> goodslist= null;
		if((List <Goods>)ActionContext.getContext().getSession().get("goodslist")==null){
			goodslist = new ArrayList<Goods>();
			goods.setAmount(1);
			goodslist.add(goods);
			ActionContext.getContext().getSession().put("goodslist", goodslist);
			System.out .println("没有session");
			return "ok";
		}else{
			goodslist = (List <Goods>)ActionContext.getContext().getSession().get("goodslist");
			if(goodslist.isEmpty()){
				goodslist = new ArrayList<Goods>();
				goods.setAmount(1);
				goodslist.add(goods);
				ActionContext.getContext().getSession().put("goodslist", goodslist);
				System.out .println("没有list");
				return "ok";
			}else{
				for(int i = 0;i<goodslist.size();i++){
					if(goodslist.get(i).getProductid().equals(pid)){
						
						goods.setAmount(goodslist.get(i).getAmount()+1);
						goodslist.set(i, goods);
						System.out .println(goods.getAmount());
						ActionContext.getContext().getSession().put("goodslist", goodslist);
						System.out .println("这本书买过一次了");
						flag = true;
						return "ok";
					}
				}
				if (!flag) {
					goods.setAmount(1);
					goodslist.add(goods);
					ActionContext.getContext().getSession().put("goodslist", goodslist);
					System.out.println("这本书每买过");
					return "ok";
				}
			}

		}
		return "ok";
		}
		else{
			return "login";
		}
		
	}

	public String deleteGoods(){
		List<Goods> goodslist = new ArrayList<Goods>();
		goodslist = (List <Goods>)ActionContext.getContext().getSession().get("goodslist");
		goodslist.remove(Integer.parseInt(pid)-1);
		ActionContext.getContext().getSession().put("goodslist", goodslist);
		return "ok";
	}
	
	public String updateGoods(){
		List<Goods> goodslist = new ArrayList<Goods>();
		goodslist = (List <Goods>)ActionContext.getContext().getSession().get("goodslist");
		Goods goods = goodslist.get(Integer.parseInt(pid)-1);
		goods.setAmount(Integer.parseInt(goodsamount));
		goodslist.set(Integer.parseInt(pid)-1, goods);
		ActionContext.getContext().getSession().put("goodslist", goodslist);
		return "ok";
	}
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getBaseprice() {
		return baseprice;
	}

	public void setBaseprice(String baseprice) {
		this.baseprice = baseprice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGoodsamount() {
		return goodsamount;
	}

	public void setGoodsamount(String goodsamount) {
		this.goodsamount = goodsamount;
	}

}

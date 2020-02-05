package com.njxzc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Product;
import com.njxzc.model.ProductExample;
import com.njxzc.service.ProductService;

@Controller
public class ProductController {

	@Resource
	ProductService productService;
	
	/**
	 * 查询所有产品
	 * @return
	 */
	@RequestMapping(value="/product/queryall")
	@ResponseBody
	public List<Product> queryall(){
		ProductExample example=new ProductExample();
		List<Product> list=productService.selectByExample(example);
		return list;
	}
	
	
	/**
	 * 根据id查询产品
	 * @param productid
	 * @return
	 */
	@RequestMapping(value="/product/selectbyid")
	@ResponseBody
	public Product queryone(Integer productid) {
		Product product=productService.selectByPrimaryKey(productid);
		return product;
	}
	
	
	/**
	 * 修改
	 * @param product
	 * @return
	 */
	@RequestMapping(value="/product/update")
	@ResponseBody
	public int update(Product product) {
		int flag;
		if(product!=null) {
			flag=productService.updateByPrimaryKeySelective(product);
			return flag;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 添加
	 * @param product
	 * @return
	 */
	@RequestMapping(value="/product/insert")
	@ResponseBody
	public int insert(Product product) {
		int flag;
		if(product!=null) {
			flag=productService.insert(product);
			return flag;
		}else {
			return 0;
		}
	}
}

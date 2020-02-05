package com.njxzc.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Buyhistory;
import com.njxzc.service.BuyhistoryService;

@Controller
public class BuyhistoryController {

	@Resource
	BuyhistoryService buyhistoryService;
	
	
	/**
	 * 查询所有客户购买记录
	 * @return
	 */
	@RequestMapping(value="/buyhistory/queryall")
	@ResponseBody
	public List<Buyhistory> queryall(){
		Buyhistory buyhistory=new Buyhistory();
		List<Buyhistory> list=buyhistoryService.queryhistory(buyhistory);
		return list;
	}
	
	
	/**
	 * 根据id查询购买记录
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/buyhistory/selectbyid")
	@ResponseBody
	public Buyhistory selectbyid(Integer buyhisid) {
		return buyhistoryService.querybyid(buyhisid);
		
	}
	
	
	/**
	 * 修改
	 * @param buyhistory
	 * @return
	 */
	@RequestMapping(value="/buyhistory/update")
	@ResponseBody
	public int update(Buyhistory buyhistory) {
		int flag;
		if(buyhistory!=null) {
			flag=buyhistoryService.updateByPrimaryKeySelective(buyhistory);
			return flag;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 添加
	 * @param buyhistory
	 * @return
	 */
	@RequestMapping(value="/buyhistory/insert")
	@ResponseBody
	public int insert(Buyhistory buyhistory,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")Date buydate) {
		int flag;
		if(buyhistory!=null) {
			buyhistory.setBuydate(buydate);
			flag=buyhistoryService.insert(buyhistory);
			return flag;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 根据客户号查购买产品
	 * @param customerid
	 * @return
	 */
	@RequestMapping(value="/buyhistory/querypro")
	@ResponseBody
	public List<Buyhistory> queryprobycus(Integer customerid){
		List<Buyhistory> list=buyhistoryService.queryprobycus(customerid);
		return list;
	}
}

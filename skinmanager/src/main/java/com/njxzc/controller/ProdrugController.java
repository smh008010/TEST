package com.njxzc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Prodrug;
import com.njxzc.service.ProdrugService;

@Controller
public class ProdrugController {

	@Resource
	ProdrugService prodrugService;
	
	/**
	 * 查询所有产品药品
	 * @return
	 */
	@RequestMapping(value="/prodrug/queryall")
	@ResponseBody
	public List<Prodrug> queryall(){
		Prodrug prodrug=new Prodrug();
		List<Prodrug> list=prodrugService.queryall(prodrug);
		return list;
	}
	
	
	/**
	 * 根据id查询
	 * @param prodrugid
	 * @return
	 */
	@RequestMapping(value="/prodrug/queryone")
	@ResponseBody
	public Prodrug querybyid(Integer prodrugid) {
		return prodrugService.querybyid(prodrugid);
	}
	
	
	/**
	 * 修改
	 * @param prodrug
	 * @return
	 */
	@RequestMapping(value="/prodrug/update")
	@ResponseBody
	public int updateProdrug(Prodrug prodrug) {
		int flag;
		if(prodrug!=null) {
			flag=prodrugService.updateByPrimaryKeySelective(prodrug);
			return flag;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 添加
	 * @param prodrug
	 * @return
	 */
	@RequestMapping(value="/prodrug/insert")
	@ResponseBody
	public int insert(Prodrug prodrug) {
		int flag;
		if(prodrug!=null) {
			flag=prodrugService.insert(prodrug);
			return flag;
		}else {
			return 0;
		}
	}
}

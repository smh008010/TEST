package com.njxzc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Drug;
import com.njxzc.service.DrugService;

@Controller
public class DrugController {

	@Resource
	DrugService drugService;
	
	/**
	 * 查询所有药品供应商信息
	 * @return
	 */
	@RequestMapping(value="/drug/queryall")
	@ResponseBody
	public List<Drug> queryall(){
		Drug drug=new Drug();
		List<Drug> list=drugService.querydrugsupplier(drug);
		return list;
	}
	
	
	/**
	 * 根据id查询药品供应商信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/drug/querybyid")
	@ResponseBody
	public Drug querybyid(Integer drugid) {
		Drug drug=drugService.querybyid(drugid);
		return drug;
	}
	
	
	/**
	 * 修改药品信息
	 * @param drug
	 * @return
	 */
	@RequestMapping(value="/drug/update")
	@ResponseBody
	public int update(Drug drug) {
		int flag;
		if(drug!=null) {
			flag=drugService.updateByPrimaryKeySelective(drug);
			return flag;
		}else {
			return 0;
		}
	}

	
	/**
	 * 添加药品
	 * @param drug
	 * @return
	 */
	@RequestMapping(value="/drug/insert")
	@ResponseBody
	public int insert(Drug drug) {
		int flag;
		if(drug!=null) {
			flag=drugService.insert(drug);
			return flag;
		}else {
			return 0;
		}
	}
	
}

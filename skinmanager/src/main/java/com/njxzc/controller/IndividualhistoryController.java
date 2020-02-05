package com.njxzc.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Individualhistory;
import com.njxzc.service.IndividualhistoryService;

@Controller
public class IndividualhistoryController {

	@Resource
	IndividualhistoryService individualhistoryService;
	
	/**
	 * 联表查询散客记录
	 * @return
	 */
	@RequestMapping(value="/individualhistory/queryall")
	@ResponseBody
	public List<Individualhistory> queryall(){
		Individualhistory individualhistory=new Individualhistory();
		List<Individualhistory> list=individualhistoryService.queryall(individualhistory);
		return list;
	}
	
	/**
	 * 添加散客记录 
	 * @param individualhistory
	 * @return
	 */
	@RequestMapping(value="/individualhistory/insert")
	@ResponseBody
	public int insert(Individualhistory individualhistory,@DateTimeFormat(pattern="yyyy-MM-dd")Date usedate) {
		int flag;
		if(individualhistory!=null) {
			individualhistory.setUsedate(usedate);
			flag=individualhistoryService.insert(individualhistory);
			return flag;
		}else {
			return 0;
		}
	}
}

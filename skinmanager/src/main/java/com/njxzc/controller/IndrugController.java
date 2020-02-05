package com.njxzc.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Indrug;
import com.njxzc.service.IndrugService;

@Controller
public class IndrugController {

	@Resource
	IndrugService indrugService;
	
	/**
	 * 查询所有入库信息
	 * @return
	 */
	@RequestMapping(value="/indrug/queryall")
	@ResponseBody
	public List<Indrug> queryall(){
		Indrug indrug=new Indrug();
		List<Indrug> list=indrugService.queryall(indrug);
		return list;
	}
	
	
	/**
	 * 根据id查询入库信息
	 * @param indrugid
	 * @return
	 */
	@RequestMapping(value="/indrug/querybyid")
	@ResponseBody
	public Indrug queryone(Integer indrugid) {
		return indrugService.queryoneid(indrugid);
	}
	
	
	/**
	 * 修改
	 * @param indrug
	 * @param date
	 * @return
	 */
	@RequestMapping(value="/indrug/update")
	@ResponseBody
	public int update(Indrug indrug,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")Date date) {
		int flag;
		if(indrug!=null) {
			indrug.setDate(date);
			flag=indrugService.updateByPrimaryKeySelective(indrug);
			return flag;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 添加
	 * @param indrug
	 * @param date
	 * @return
	 */
	@RequestMapping(value="/indrug/insert")
	@ResponseBody
	public int insert(Indrug indrug,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")Date date) {
		int flag;
		if(indrug!=null) {
			indrug.setDate(date);
			flag=indrugService.insert(indrug);
			return flag;
		}else {
			return 0;
		}
	}
}

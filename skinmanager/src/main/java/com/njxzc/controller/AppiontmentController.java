package com.njxzc.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.njxzc.model.Appiontment;
import com.njxzc.service.AppiontmentService;

@Controller
public class AppiontmentController {

	@Resource
	AppiontmentService appiontmentService;
	
	
	/**
	 * 查询所有预约
	 * @return
	 */
	@RequestMapping(value="/appiontment/queryall")
	@ResponseBody
	public List<Appiontment> queryall(){
		Appiontment appiontment=new Appiontment();
		List<Appiontment> list=appiontmentService.queryall(appiontment);
		return list;
	}
	
	
	/**
	 * 根据id查询预约
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/appiontment/selectbyid")
	@ResponseBody
	public Appiontment selectbyid(Integer appid) {
		Appiontment appiontment=appiontmentService.queryone(appid);
		return appiontment;
	}
	
	
	/**
	 * 修改
	 * @param appiontment
	 * @return
	 */
	@RequestMapping(value="/appiontment/update")
	@ResponseBody
	public int update(Appiontment appiontment) {
		int flag;
		if(appiontment!=null) {
			flag=appiontmentService.updateByPrimaryKeySelective(appiontment);
			return flag;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 添加
	 * @param appiontment
	 * @return
	 */
	@RequestMapping(value="/appiontment/insert")
	public int insert(Appiontment appiontment,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")Date date) {
		int flag;
		if(appiontment!=null) {
			appiontment.setDate(date);
			flag=appiontmentService.insert(appiontment);
			return flag;
		}else {
			return 0;
		}
	}
	
	/**
	 * 删除
	 * @param appiontment
	 * @return
	 */
	@RequestMapping(value="/appiontment/delete")
	@ResponseBody
	public int delete(Appiontment appiontment) {
		int flag;
		if(appiontment!=null) {
			flag=appiontmentService.deleteapp(appiontment);
			return flag;
		}else {
			return 0;
		}
	}
	
	/**
	 * 完成
	 * @param appiontment
	 * @return
	 */
	@RequestMapping(value="/appiontment/complete")
	@ResponseBody
	public int complete(Appiontment appiontment) {
		int flag;
		if(appiontment!=null) {
			flag=appiontmentService.completeapp(appiontment);
			return flag;
		}else {
			return 0;
		}
	}
	
}

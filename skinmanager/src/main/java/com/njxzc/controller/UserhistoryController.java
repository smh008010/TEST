package com.njxzc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Userhistory;
import com.njxzc.service.UserhistoryService;

@Controller
public class UserhistoryController {

	@Resource
	UserhistoryService userhistoryService;
	
	/**
	 * 查询所有使用情况
	 * @return
	 */
	@RequestMapping(value="/userhistory/queryall")
	@ResponseBody
	public List<Userhistory> queryall(){
		Userhistory userhistory=new Userhistory();
		List<Userhistory> list=userhistoryService.queryall(userhistory);
		return list;
	}
	
	/**
	 * 添加
	 * @param userhistory
	 * @param usedate
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/userhistory/insert")
	@ResponseBody
	public int insert(Userhistory userhistory){
		int flag;
		if(userhistory!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date usedate = new Date();
			try {
				usedate=sdf.parse(sdf.format(new Date()));
			}catch(ParseException e){
				e.printStackTrace();
			}
			userhistory.setUsedate(usedate);
			flag=userhistoryService.insert(userhistory);
			return flag;
		}else {
			return 0;
		}
	}
	

	/**
	 * 根据id查询
	 * @param useproid
	 * @return
	 */
	@RequestMapping(value="/userhistory/queryone")
	@ResponseBody
	public Userhistory querybyid(Integer useproid) {
		//System.out.println(useproid);
		return userhistoryService.querybyid(useproid);
	}
	
	
	/**
	 * 修改
	 * @param userhistory
	 * @param usedate
	 * @return
	 */
	@RequestMapping(value="/userhistory/update")
	@ResponseBody
	public int update(Userhistory userhistory,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")Date usedate) {
		int flag;
		if(userhistory!=null) {		
			userhistory.setUsedate(usedate);
			//System.out.println(userhistory);
			flag=userhistoryService.updateByPrimaryKeySelective(userhistory);
			//System.out.println(flag);
			return flag;
		}else {
			return 0;
		}
	}
}

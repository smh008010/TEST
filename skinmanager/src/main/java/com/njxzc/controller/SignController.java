package com.njxzc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Sign;
import com.njxzc.model.User;
import com.njxzc.service.SignService;

@Controller
public class SignController {

	@Resource
	SignService signService;
	
	
	/**
	 * 查询所有预约信息
	 * @return
	 */
	@RequestMapping(value="/sign/queryall")
	@ResponseBody
	public List<Sign> queryall(){
		Sign sign=new Sign();
		return signService.queryall(sign);
	}
	
	
	/**
	 * 根据id查询预约信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/sign/queryone")
	@ResponseBody
	public Sign querybyid(Integer id) {
		return signService.queryone(id);
	}
	
	
	/**
	 * 修改
	 * @param sign
	 * @return
	 */
	public int update(Sign sign,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")Date date) {
		int flag;
		if(sign!=null) {
			sign.setDate(date);
			flag=signService.updateByPrimaryKeySelective(sign); 
			return flag;
		}else {
			return 0;
		}
	}
	
	
	
	/**
	 * 添加
	 * @param sign
	 * @param date
	 * @return
	 */
	public int insert(Sign sign,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")Date date) {
		int flag;
		if(sign!=null) {
			sign.setDate(date);
			flag=signService.insert(sign);
			return flag;
		}else {
			return 0;
		}
	}
	
	/**
	 * 按月统计所有员工的签到记录
	 * @return
	 */
	@RequestMapping(value="/sign/querysign")
	@ResponseBody
	public List<Sign> querysign(){
		Sign sign=new Sign();
		List<Sign> list=signService.querysign(sign);
		//System.out.println(list);
		return list;
	}
	
	
	/**
	 * 签到
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/sign/toSignIn",method = RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> signIn(HttpSession session) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		User userSessoion=(User)session.getAttribute("user");
		Integer userid=userSessoion.getUserid();
		//System.out.println(userid+"!");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		try {
			date=sdf.parse(sdf.format(new Date()));
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		int flag=signService.inSignIn(userid, date);
		if(flag==0) {
			resultMap.put("result", "false");
		}else {
			resultMap.put("result", "true");
		}
		
		return resultMap;
	}
}

package com.njxzc.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Instrument;
import com.njxzc.model.InstrumentExample;
import com.njxzc.service.InstrumentService;

@Controller
public class InstrumentController {
	
	@Resource
	InstrumentService instrumentService;
	
	/**
	 * 查询所有设备信息
	 * @return
	 */
	@RequestMapping(value="/instrument/queryall")
	@ResponseBody
	public List<Instrument> queryall(){
		InstrumentExample example=new InstrumentExample();
		List<Instrument> list=instrumentService.selectByExample(example);
		return list;
	}

	
	/**
	 * 根据id查询设备信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/instrument/querybyid")
	@ResponseBody
	public Instrument querybyid(Integer instrutmentid) {
		Instrument instrument=instrumentService.selectByPrimaryKey(instrutmentid);
		return instrument;
	}
	
	
	/**
	 * 修改
	 * @param instrument
	 * @param begintime
	 * @return
	 */
	@RequestMapping(value="/instrument/update")
	@ResponseBody
	public int update(Instrument instrument,@DateTimeFormat(pattern="yyyy-MM-dd") Date begintime) {
		int flag;
		if(instrument!=null) {
			instrument.setBegintime(begintime);
			flag=instrumentService.updateByPrimaryKeySelective(instrument);
			return flag;
		}else {
			return 0;
		}
		
	}
	
	
	/**
	 * 添加
	 * @param instrument
	 * @param begintime
	 * @return
	 */
	@RequestMapping(value="/instrument/insert")
	@ResponseBody
	public int insert(Instrument instrument,@DateTimeFormat(pattern="yyyy-MM-dd") Date begintime){
		int flag;
		if(instrument!=null) {
			instrument.setBegintime(begintime);
			flag=instrumentService.insert(instrument);
			return flag;
		}else {
			return 0;
		}
	}
	
}

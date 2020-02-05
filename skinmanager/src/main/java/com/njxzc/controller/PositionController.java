package com.njxzc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njxzc.model.Menu;
import com.njxzc.model.Position;
import com.njxzc.model.PositionExample;
import com.njxzc.pojo.TreeObj;
import com.njxzc.service.MenuService;
import com.njxzc.service.PositionService;
import com.njxzc.service.PositionmenuService;

@Controller
public class PositionController {

	@Resource
	private PositionService positionService;
	
	@Resource
	private MenuService menuservice;
	
	@Resource
	private PositionmenuService positionmenuService; 
	/**
	 * 查询所有职位
	 * @return
	 */
	@RequestMapping(value="/position/queryallpo")
	@ResponseBody
	public List<Position> queryallpo(){
		PositionExample positionExample=new PositionExample();
		List<Position> poList=positionService.selectByExample(positionExample);
		return poList;
	}
	
	/**
	 * 跳转到分配权限页面
	 * @param poId
	 * @return
	 */
	@RequestMapping(value="/sendAuthority")
	@ResponseBody
	public List<TreeObj> sendAuthority(Integer poid) {
		//查询所有的菜单
		List<Menu> allmenu=menuservice.querybyparentid(0);
		
		//根据岗位id查询权限菜单
		List<Integer> ownerlist=positionmenuService.selectmenubypoid(poid);
		
		return merge(allmenu, ownerlist);
	}
	
	/**
	 * 匹配权限
	 * @param allmenu
	 * @param ownerlist
	 * @return
	 */
	public List<TreeObj> merge(List<Menu> allmenu,List<Integer> ownerlist){
		List<TreeObj> tList=new ArrayList<TreeObj>();
		if(allmenu != null) {
			for (Menu m : allmenu) {
				TreeObj treeObj=new TreeObj();
				treeObj.setTid(m.getMenuId());
				treeObj.setName(m.getMenuName());
				treeObj.setChecked(hasAuthority(m.getMenuId(), ownerlist));
				treeObj.setChildren(merge(m.getChildMenu(), ownerlist));
				treeObj.setOpen(false);
				treeObj.setParentid(m.getParentId());
				treeObj.setUrl(m.getMenuUrl());
			    
				tList.add(treeObj);
			}
		}
		return tList;
	}
	

	/**
	 * 判断是否有权限
	 * @return
	 */
	public  boolean hasAuthority(Integer menuId,List<Integer> ownerlist) {
		if(ownerlist != null) {
			for (Integer b : ownerlist) {
				if(menuId == b) {
					return true;
				}
				
			}
		}
			return false;
		
	}
	
	@RequestMapping(value="/saveAuthority")
	@ResponseBody
	public int saveAuthority(Integer poid,Integer[] menuIds) {
		return positionmenuService.saveAuthority(poid, menuIds);
	}
	
	/**
	 * 根据poid查询职位信息
	 * @param poid
	 * @return
	 */
	@RequestMapping(value="/position/selectbypoid")
	@ResponseBody
	public Position selectbypoid(int poid) {
		Position position=positionService.selectByPrimaryKey(poid);
		return position;
	}
	
	/**
	 * 修改
	 * @param position
	 * @return
	 */
	@RequestMapping(value="/position/updateposition")
	@ResponseBody
	public int updateposition(Position position) {
		int flag;
		if(position!=null) {
			flag=positionService.updateByPrimaryKeySelective(position);
			return flag;
		}else {
			return 0;
		}
	}
	
	/**
	 * 添加
	 * @param position
	 * @return
	 */
	@RequestMapping(value="/position/insertpo")
	@ResponseBody
	public int insertpo(Position position) {
		if(position!=null) {
			return positionService.insert(position);
		}else {
			return 0;
		}
	}
}

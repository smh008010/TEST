package com.njxzc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.njxzc.model.Appiontment;
import com.njxzc.model.Menu;
import com.njxzc.model.Position;
import com.njxzc.model.Sign;
import com.njxzc.model.User;
import com.njxzc.pojo.MenuPojo;
import com.njxzc.service.AppiontmentService;
import com.njxzc.service.PositionService;
import com.njxzc.service.PositionmenuService;
import com.njxzc.service.SignService;
import com.njxzc.service.UserService;
import com.njxzc.service.impl.MenuServiceImpl;


@Controller
public class UserController {
	@Resource
	private UserService userService;
	
	@Resource
	private PositionmenuService positionmenuService;
	
	@Resource
	private MenuServiceImpl menuServiceImpl;
	
	@Resource
	private PositionService positionService;
	
	@Resource
	private SignService signService;
	
	@Resource
	private AppiontmentService appiontmentService;
	
	/**
	 * 登录
	 * @param username
	 * @param userpwd
	 * @param code
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login")
	public ModelAndView login(String username,String userpwd,String code,HttpServletRequest request ) {
		ModelAndView mv=new ModelAndView();
		
		//获取Session对象
		HttpSession session=request.getSession();
		
		//获取随机生成的验证码
		String randomCode=session.getAttribute(Constants.KAPTCHA_SESSION_KEY).toString();
		
		//判断验证码输入是否正确
		if(code.equalsIgnoreCase(randomCode)) {
		
			//判断用户名和密码输入是否正确
			User user=userService.login(username, userpwd);
			
			if(user != null) {
				//得到职位id
				Integer poid=user.getPoid();
				Position position=positionService.selectByPrimaryKey(poid);
				session.setAttribute("user",user);
				session.setAttribute("position", position);
				
				//根据职位id查询对应权限菜单
				List<Integer> ownerList=positionmenuService.selectmenubypoid(poid);
				
				List<Menu> list=menuServiceImpl.querybyparentid(0);
				
				List<MenuPojo> menuList=merge(ownerList,list);
				
				mv.addObject("menuList", menuList);
				
				mv.setViewName("main");
			}else {
				
				mv.setViewName("login");
			}
			
		}else {
			
			mv.setViewName("login");
		}
		return mv;
	}
	
	/**
	 * 匹配权限
	 * @param ownerList
	 * @param list
	 * @return
	 */
	public List<MenuPojo> merge(List<Integer> ownerList,List<Menu> list){
		List<MenuPojo> menuPojoList =new ArrayList<>();
		if(list != null) {
			for (Menu menu : list) {
				if(hasAuthority(menu, ownerList)) {
					MenuPojo mp = new MenuPojo();
					mp.setMenuId(menu.getMenuId());
					mp.setHasAuthority(false);
					mp.setMenuName(menu.getMenuName());
					mp.setMenuUrl(menu.getMenuUrl());
					mp.setParentId(menu.getParentId());
					mp.setMenuLevel(menu.getMenuLevel());
					mp.setMenuDelete(menu.getMenuDelete());
					mp.setChildMenuPojo(merge(ownerList,menu.getChildMenu()));
					menuPojoList.add(mp);
				}
			}
		}
		return menuPojoList;
    }
	
	/**
	 * 判断是否有权限
	 * @param menu
	 * @param ownerList
	 * @return
	 */
	public boolean hasAuthority(Menu menu,List<Integer> ownerList) {
		boolean flag = false;
		if(ownerList != null){
			for (Integer b : ownerList) {
				if(menu.getMenuId()==b) {
					flag=true;
				}
			}
		}
		return flag;
	}
	
	/**
	 * 联表查询所有员工
	 * @return
	 */
	@RequestMapping(value="/user/selectalluser")
	@ResponseBody
	public List<User> selectalluser(){
		User user=new User();
		List<User> list=userService.selectalluser(user);
		//System.out.print(list);
		return list;
	}
	
	/**
	 * 根据id联表查询
	 * @param userid
	 * @return
	 */
	@RequestMapping(value="/user/selectbyid")
	@ResponseBody
	public User selectbyid(Integer userid) {
		User user=userService.selectbyuserid(userid);
		return user;
	}
	
	/**
	 * 修改
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/user/updateuser")
	@ResponseBody
	public int updateuser(User user) {
		int flag;
		if(user != null) {
			flag=userService.updateByPrimaryKeySelective(user);
			return flag;
		}else {
			return 0;
		}
	}
	
	
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/user/adduser")
	@ResponseBody
	public int adduser(User user) {
		if(user != null ) {
			return userService.insertSelective(user);
		}else {
			return 0;
		}
		
	}
	
	/**
	 * 个人信息
	 * @param userid
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/queryown")
	@ResponseBody
	public String queryown(Integer userid,HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		Integer id=((User)session.getAttribute("user")).getUserid();
		System.out.println(id);
		User users=userService.selectbyuserid(id);
		request.setAttribute("user", users);
		model.addAttribute("user", users);
		return "userown";
	}
	
	/**
	 * 个人职位信息
	 * @param userid
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/queryownpo")
	@ResponseBody
	public String queryownpo(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		Integer id=((User)session.getAttribute("user")).getPoid();
		Position position=positionService.selectByPrimaryKey(id);
		request.setAttribute("position", position);
		model.addAttribute("position", position);
		return "userownpo";
	}
	
	
	/**
	 * 用户是否签到
	 * @param request
	 * @param model
	 * @return
	 */
	
	@RequestMapping(value="/user/sign", method = RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> signIn(HttpSession session, Model model) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		User userSessoion=(User)session.getAttribute("user");
		Integer userid=userSessoion.getUserid();
		//System.out.println(userid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		try {
			date=sdf.parse(sdf.format(new Date()));
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		Sign sign=signService.querystate(userid, date);
		if(sign==null) {
			resultMap.put("result", "false");
		}else {
			resultMap.put("result", "true");
		}
		
		return resultMap;
	}
	
	
	/**
	 * 查看个人预约
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/queryapp")
	@ResponseBody
	public List<Appiontment> queryapplist(HttpSession session, Model model){
		User userSessoion=(User)session.getAttribute("user");
		Integer userid=userSessoion.getUserid();
		List<Appiontment> list=appiontmentService.querybyuserid(userid);
		return list;
	}
}

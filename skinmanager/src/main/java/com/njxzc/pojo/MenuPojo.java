package com.njxzc.pojo;

import java.util.ArrayList;
import java.util.List;

public class MenuPojo {

	private Integer menuId;

    private String menuName;

    private String menuUrl;

    private Integer parentId;

    private Integer menuLevel;

    private Integer menuDelete;

    private boolean hasAuthority;
    
    private List<MenuPojo> childMenuPojo = new ArrayList<>();
    
    public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}


	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(Integer menuLevel) {
		this.menuLevel = menuLevel;
	}


	public Integer getMenuDelete() {
		return menuDelete;
	}

	public void setMenuDelete(Integer menuDelete) {
		this.menuDelete = menuDelete;
	}

	public boolean isHasAuthority() {
		return hasAuthority;
	}

	public void setHasAuthority(boolean hasAuthority) {
		this.hasAuthority = hasAuthority;
	}

	public List<MenuPojo> getChildMenuPojo() {
		return childMenuPojo;
	}

	public void setChildMenuPojo(List<MenuPojo> childMenuPojo) {
		this.childMenuPojo = childMenuPojo;
	}

	
    
}

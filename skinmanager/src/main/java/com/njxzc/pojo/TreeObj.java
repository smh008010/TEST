package com.njxzc.pojo;

import java.util.ArrayList;
import java.util.List;

public class TreeObj {

	private Integer tid;
	private String name;
	private String url;
	private boolean open;//true:展开 false:折叠
	private List<TreeObj> children=new ArrayList<>();
	private Integer parentid;
	private boolean checked;// true:被选中 false:未选中
	//private String icon;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public List<TreeObj> getChildren() {
		return children;
	}
	public void setChildren(List<TreeObj> children) {
		this.children = children;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
}

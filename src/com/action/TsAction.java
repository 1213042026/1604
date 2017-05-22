package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TsDAO;
import com.model.Ts;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

public class TsAction extends ActionSupport {
	private int id;
	private String names;//
	private Date times;
	private String descs;
	private String message;
	private String path;
	private int index = 1;
	private TsDAO dao;
	private String[] selectFlag;

	public String add() {
		Map session = ServletActionContext.getContext().getSession();
		String realname = session.get("realname").toString();
		Ts bean = new Ts();
		bean.setNames(realname);
		bean.setHfdescs("");
		bean.setTimes(new Date());
		bean.setDescs(descs);
		dao.save(bean);
		this.setMessage("添加成功");
		this.setPath("tsmana2.action");
		return "succeed";
	}

	public String mana() {

		List adminList = dao.findAll();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("tsmana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String mana2() {
		Map session = ServletActionContext.getContext().getSession();
		List adminList = dao.findAll();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("tsmana2.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String del() {

		dao.delete(dao.findById(id));

		this.setMessage("删除成功");
		this.setPath("tsmana2.action");
		return "succeed";
	}
	
	public String hf() {
		Ts bean = dao.findById(id);
		bean.setHfdescs(descs);
		dao.merge(bean);

		this.setMessage("回复成功");
		this.setPath("tsmana.action");
		return "succeed";
	}

	public String getMessage() {
		return message;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TsDAO getDao() {
		return dao;
	}

	public void setDao(TsDAO dao) {
		this.dao = dao;
	}

	public Date getTimes() {
		return times;
	}

	public void setTimes(Date times) {
		this.times = times;
	}

	public String getDescs() {
		return descs;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public String[] getSelectFlag() {
		return selectFlag;
	}

	public void setSelectFlag(String[] selectFlag) {
		this.selectFlag = selectFlag;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

}

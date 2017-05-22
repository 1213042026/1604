package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.DemoDAO;
import com.model.Demo;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

public class DemoAction extends ActionSupport {
	private int id;
	private String message;
	private String path;
	private String descs;
	private Date times;
	private String types;
	private int index = 1;
	private DemoDAO dao;


	public String viewgmzn() {//购买指南
		Demo bean = dao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("bean", bean);
		return ActionSupport.SUCCESS;
	}

	public String modifygmzn() {
		Demo bean = dao.findById(id);
		bean.setDescs(descs);
		bean.setTimes(new Date());
		dao.merge(bean);
		this.setMessage("操作成功");
		this.setPath("demomana.action");
		return "succeed";
	}

	public String mana() {
		List list = dao.findAll();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, list.size());
		List adminListFenye = list.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(list.size());//
		p.setData(adminListFenye);//
		p.setPath("demomana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String demoindex() {//前台展示详细
		String strtypes="";
		
		if(types.equals("1")){
			strtypes="购买指南";
		}else if(types.equals("2")){
			strtypes="交费指南";
		}else if(types.equals("3")){
			strtypes="保单查询";
		}else if(types.equals("4")){
			strtypes="保单售后服务";
		}else if(types.equals("5")){
			strtypes="保单理赔服务";
		}else if(types.equals("6")){
			strtypes="国寿1+N增值服务";
		}else if(types.equals("7")){
			strtypes="保险说明";
		}else if(types.equals("8")){
			strtypes="保单说明";
		}else if(types.equals("9")){
			strtypes="常见问题";
		}else if(types.equals("10")){
			strtypes="公司概要";
		}else if(types.equals("11")){
			strtypes="公司基本信息";
		}else if(types.equals("12")){
			strtypes="公司治理结构";
		}else if(types.equals("13")){
			strtypes="董事会";
		}else if(types.equals("14")){
			strtypes="监事会";
		}else if(types.equals("15")){
			strtypes="专门委员会";
		}else if(types.equals("16")){
			strtypes="管理层";
		}
		Demo bean = dao.findByTypes(strtypes);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("bean", bean);
		return ActionSupport.SUCCESS;
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


	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public String getDescs() {
		return descs;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public Date getTimes() {
		return times;
	}

	public void setTimes(Date times) {
		this.times = times;
	}

	public DemoDAO getDao() {
		return dao;
	}

	public void setDao(DemoDAO dao) {
		this.dao = dao;
	}

}

package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TAdminDAO;
import com.model.Car;
import com.model.TAdmin;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

public class adminAction extends ActionSupport {
	private int id;
	private String username;
	private String password;
	private String email;
	private String tel;
	private String realname;
	private String newpwd;
	private String no;
	private String message;
	private String path;
	private String[] selectFlag;
	private int index = 1;

	private TAdminDAO adminDAO;

	public String login() {
		String result = "no";// 登入结果
		String sql = "from TAdmin where username=? and password=?";// 查询sql
		Object[] con = { username, password };// 查询参数
		List adminList = adminDAO.getHibernateTemplate().find(sql, con);// 查询数据库
		if (adminList.size() != 0) {//
			Map session = ServletActionContext.getContext().getSession();
			TAdmin admin = (TAdmin) adminList.get(0);// 把结果放入session
			session.put("id", admin.getId());
			session.put("userType", admin.getRoles());
			session.put("admin", admin);
			session.put("realname", admin.getRealname());
			result = "yes";

		}
		return result;
	}

	public String loginout() {
		Map session = ServletActionContext.getContext().getSession();
		session.put("userType", "");
		session.put("admin", null);
		return ActionSupport.SUCCESS;
	}

	public String adminupdatepwd() {
		Map session = ServletActionContext.getContext().getSession();
		TAdmin admin = (TAdmin) session.get("admin");
		admin.setPassword(newpwd);
		adminDAO.merge(admin);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("ok", "ok");
		return ActionSupport.SUCCESS;
	}

	public String adminupdatepwd2() {
		Map session = ServletActionContext.getContext().getSession();
		// Yg admin = (Yg) session.get("admin");
		// admin.setPassword(newpwd);
		// adminDAO.mergeYg(admin);
		// HttpServletRequest req = ServletActionContext.getRequest();
		// req.setAttribute("ok", "ok");
		return ActionSupport.SUCCESS;
	}

	public String add() {
		TAdmin admin = new TAdmin();
		admin.setEmail(email);
		admin.setPassword(password);
		admin.setRealname(realname);
		admin.setTel(tel);
		admin.setNo(no);
		admin.setUsername(username);
		admin.setRoles("客户");
		adminDAO.save(admin);
		this.setMessage("添加成功");
		this.setPath("adminmana.action");
		return "succeed";
	}

	public String mana() {

		System.out.println("###############  " + username);
		System.out.println("###############  " + realname);
		List adminList = adminDAO.findAll(username, realname);
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("adminManageFenye.action?");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String modifybefore() {
		TAdmin bean = adminDAO.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("bean", bean);
		return ActionSupport.SUCCESS;
	}

	public String modify() {
		TAdmin bean = adminDAO.findById(id);
		bean.setEmail(email);
		bean.setPassword(password);
		bean.setRealname(realname);
		bean.setTel(tel);
		adminDAO.merge(bean);
		this.setMessage("操作成功");
		this.setPath("adminmana.action");
		return "succeed";
	}

	public String del() {

		for (int i = 0; i < selectFlag.length; i++) {
			adminDAO.delete(adminDAO.findById(Integer.parseInt(selectFlag[i])));
		}

		this.setMessage("删除成功");
		this.setPath("adminmana.action");
		return "succeed";
	}

	public TAdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(TAdminDAO adminDAO) {
		this.adminDAO = adminDAO;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String[] getSelectFlag() {
		return selectFlag;
	}

	public void setSelectFlag(String[] selectFlag) {
		this.selectFlag = selectFlag;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

}

package com.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.dao.CarDAO;
import com.model.Pp;
import com.model.Car;
import com.model.TAdmin;
import com.model.Yy;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

public class CarAction extends ActionSupport {
	private int id;
	private String types;
	private int nums;
	private String no;
	private String stuname;
	private String jzname;
	private String descs;
	private String tel;
	private String address;
	private String btimes;
	private String etimes;
	private String dw;
	private String stupwd;
	private String jzpwd;
	private String sj;
	private String dz;
	private String hp;
	private String qz;
	private String names;
	private String bjnames;
	private String moneys;
	private String jsname;
	private String month;
	private String km;
	private String times;
	private String bt;
	private String et;
	private String message;
	private String path;
	private int index = 1;
	private CarDAO dao;
	private String[] selectFlag;
	private File image; // 上传的文件
	private String imageFileName; // 文件名称 p
	private String imageContentType; // 文件类型

	public String add() {

		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/files");
		Date date2 = new Date();
		String fileName = "";
		try {
			if (image != null && imageFileName != null
					&& !imageFileName.equals("")) {
				String type = imageFileName.substring(imageFileName
						.lastIndexOf("."));
				Random rnd = new Random();
				int r = rnd.nextInt(100);

				SimpleDateFormat formatter = new SimpleDateFormat(
						"yyyyMMddHHmmss");
				String strDate2 = formatter.format(date2);

				fileName = strDate2 + r + type;
				File savefile = new File(new File(realpath), fileName);
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				FileUtils.copyFile(image, savefile);

			}
			Car bean = new Car();
			bean.setAddress(address);
			bean.setDw(dw);
			bean.setUrl("files/" + fileName);
			bean.setJzname(jzname);
			bean.setJzpwd(jzpwd);
			bean.setBjnames(bjnames);
			
			List bjlist = dao.findAllBjByNames(bjnames);
			for (int i = 0; i < bjlist.size(); i++) {
				Pp b = (Pp) bjlist.get(i);
				int oldnums = b.getNums();
				int newnums = oldnums + 1;
				b.setNums(newnums);
				dao.merge(b);
			}
			bean.setNo(no);
			bean.setStuname(stuname);
			bean.setStupwd(stupwd);
			bean.setTel(tel);
			bean.setBt(bt);
			bean.setEt(et);
			bean.setYynum(0);
			dao.save(bean);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		this.setMessage("添加成功");
		this.setPath("carmana.action");
		return "succeed";
	}

	public String bjadd() {
		Pp bean = new Pp();
		bean.setNames(names);
		bean.setTypes(types);
		bean.setNums(0);
		dao.saveBj(bean);
		this.setMessage("添加成功");
		this.setPath("bjmana.action");
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
		p.setPath("carmana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String carmanatj() {

		List adminList = dao.findAlltj();
		
		
		 Collections.sort(adminList, new Comparator() {
	            public int compare(Object a, Object b) {
	                int one = ((Car) a).getYynum();
	                int two = ((Car) b).getYynum();
	                return two-one;
	            }
	        });
		
		
		
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("carmanatj.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String bjmana() {

		List adminList = dao.findAllBj();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("bjmana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String yymana2() {

		List adminList = dao.findAllYy();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("yymana2.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String yymana() {
		Map session = ServletActionContext.getContext().getSession();
		String realname = session.get("realname").toString();
		List adminList = dao.findAllYyByNames(realname);
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("yymana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String xfmana() {

		List adminList = dao.findAllXf();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("xfmana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String gzmana() {

		List adminList = dao.findAllGz();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("gzmana.action");//

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
		p.setPath("carmana2.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String cjaddbefore() {

		List list = dao.findAll();

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("list", list);
		return ActionSupport.SUCCESS;
	}

	public String zyaddbefore() {

		List list = dao.findAll();

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("list", list);
		return ActionSupport.SUCCESS;
	}

	public String caraddbefore() {

		List list = dao.findAllBj();

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("list", list);
		return ActionSupport.SUCCESS;
	}

	public String yyadd() {

		Map session = ServletActionContext.getContext().getSession();
		String realname = session.get("realname").toString();
		int uid = Integer.parseInt(session.get("id").toString());
		Yy bean = new Yy();
		bean.setDescs(descs);
		bean.setTimes(times);
		bean.setUid(uid);
		bean.setCid(id);
		bean.setCarnames(dao.findById(id).getStuname());
		bean.setUnames(realname);
		bean.setSh("未审核");
		dao.saveYy(bean);
		Car c = dao.findById(id);
		int yynum = c.getYynum();
		yynum+=1;
		c.setYynum(yynum);
		dao.merge(c);
		
		this.setMessage("预约成功");
		this.setPath("yymana.action");
		return "succeed";
	}

	public String yymodify() {

		Yy bean = dao.findYyById(id);
		bean.setDescs(descs);
		bean.setTimes(times);
		dao.merge(bean);
		this.setMessage("预约成功");
		this.setPath("yymana.action");
		return "succeed";
	}
	public String yyshtg() {

		Yy bean = dao.findYyById(id);
		bean.setSh("通过");
		dao.merge(bean);
		this.setMessage("审核完成");
		this.setPath("yymana2.action");
		return "succeed";
	}
	public String yyshwtg() {

		Yy bean = dao.findYyById(id);
		bean.setSh("未通过");
		dao.merge(bean);
		this.setMessage("审核完成");
		this.setPath("yymana2.action");
		return "succeed";
	}
	public String cjmana() {

		List adminList = dao.findAllCj();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("cjmana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String cjmana2() {
		Map session = ServletActionContext.getContext().getSession();
		String stuname = session.get("stuname").toString();
		List adminList = dao.findAllCj(stuname);
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("cjmana2.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String qjmana() {

		List adminList = dao.findAllQj();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("qjmana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String qjmana2() {
		Map session = ServletActionContext.getContext().getSession();
		String stuname = session.get("stuname").toString();
		List adminList = dao.findAllQj(stuname);
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("qjmana2.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String zymana() {

		List adminList = dao.findAllZy();
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("zymana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String zymana2() {
		Map session = ServletActionContext.getContext().getSession();
		String stuname = session.get("stuname").toString();
		List adminList = dao.findAllZy(stuname);
		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());
		List adminListFenye = adminList.subList(fromIndex, toIndex);

		Pagination p = new Pagination();//
		p.setIndex(index);//
		p.setPageSize(pageSize);
		p.setTotle(adminList.size());//
		p.setData(adminListFenye);//
		p.setPath("zymana2.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String modifybefore() {
		List list = dao.findAllBj();

		Car bean = dao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("bean", bean);
		request.put("list", list);
		return ActionSupport.SUCCESS;
	}

	public String yymb() {
		Yy bean = dao.findYyById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("bean", bean);
		return ActionSupport.SUCCESS;
	}

	public String modify() {
		Car bean = dao.findById(id);

		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/files");
		Date date2 = new Date();
		String fileName = "";
		try {
			if (image != null && imageFileName != null
					&& !imageFileName.equals("")) {
				String type = imageFileName.substring(imageFileName
						.lastIndexOf("."));
				Random rnd = new Random();
				int r = rnd.nextInt(100);

				SimpleDateFormat formatter = new SimpleDateFormat(
						"yyyyMMddHHmmss");
				String strDate2 = formatter.format(date2);

				fileName = strDate2 + r + type;
				File savefile = new File(new File(realpath), fileName);
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				FileUtils.copyFile(image, savefile);
				bean.setUrl("files/" + fileName);
			}
			bean.setAddress(address);
			bean.setDw(dw);
			bean.setJzname(jzname);
			bean.setJzpwd(jzpwd);
			bean.setBjnames(bjnames);
			bean.setNo(no);
			bean.setStuname(stuname);
			bean.setStupwd(stupwd);
			bean.setTel(tel);
			bean.setBt(bt);
			bean.setEt(et);
			dao.merge(bean);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		this.setMessage("修改成功");
		this.setPath("carmana.action");
		return "succeed";
	}

	public String del() {
		Car bean = dao.findById(id);
		dao.delete(bean);
		this.setMessage("删除成功");
		this.setPath("carmana.action");
		return "succeed";
	}

	public String yydel() {
		Yy bean = dao.findYyById(id);
		dao.deleteyy(bean);
		this.setMessage("删除成功");
		this.setPath("yymana.action");
		return "succeed";
	}

	public String bjdel() {
		Pp bean = dao.findBjById(id);
		dao.deletebj(bean);
		this.setMessage("删除成功");
		this.setPath("bjmana.action");
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

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getStuname() {
		return stuname;
	}

	public void setStuname(String stuname) {
		this.stuname = stuname;
	}

	public String getJzname() {
		return jzname;
	}

	public void setJzname(String jzname) {
		this.jzname = jzname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public String getStupwd() {
		return stupwd;
	}

	public void setStupwd(String stupwd) {
		this.stupwd = stupwd;
	}

	public String getJzpwd() {
		return jzpwd;
	}

	public void setJzpwd(String jzpwd) {
		this.jzpwd = jzpwd;
	}

	public CarDAO getDao() {
		return dao;
	}

	public void setDao(CarDAO dao) {
		this.dao = dao;
	}

	public String[] getSelectFlag() {
		return selectFlag;
	}

	public void setSelectFlag(String[] selectFlag) {
		this.selectFlag = selectFlag;
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

	public String getSj() {
		return sj;
	}

	public void setSj(String sj) {
		this.sj = sj;
	}

	public String getDz() {
		return dz;
	}

	public void setDz(String dz) {
		this.dz = dz;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getQz() {
		return qz;
	}

	public void setQz(String qz) {
		this.qz = qz;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getBtimes() {
		return btimes;
	}

	public void setBtimes(String btimes) {
		this.btimes = btimes;
	}

	public String getEtimes() {
		return etimes;
	}

	public void setEtimes(String etimes) {
		this.etimes = etimes;
	}

	public int getNums() {
		return nums;
	}

	public void setNums(int nums) {
		this.nums = nums;
	}

	public String getBjnames() {
		return bjnames;
	}

	public void setBjnames(String bjnames) {
		this.bjnames = bjnames;
	}

	public String getMoneys() {
		return moneys;
	}

	public void setMoneys(String moneys) {
		this.moneys = moneys;
	}

	public String getJsname() {
		return jsname;
	}

	public void setJsname(String jsname) {
		this.jsname = jsname;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getKm() {
		return km;
	}

	public void setKm(String km) {
		this.km = km;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getBt() {
		return bt;
	}

	public void setBt(String bt) {
		this.bt = bt;
	}

	public String getEt() {
		return et;
	}

	public void setEt(String et) {
		this.et = et;
	}

}

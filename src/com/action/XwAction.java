package com.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.dao.XwDAO;
import com.model.TAdmin;
import com.model.Xw;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

public class XwAction extends ActionSupport {
	private int id;
	private String titles;//
	private String descs;
	private Date times;
	private String message;
	private String path;
	private int index = 1;
	private XwDAO dao;
	private File image; // 上传的文件
	private String imageFileName; // 文件名称 p
	private String imageContentType; // 文件类型

	public String add() {

		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/files");
		System.out.println("  " + image.getName());
		Date date2 = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
		String strDate3 = formatter2.format(date2);
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
			Map session = ServletActionContext.getContext().getSession();
			TAdmin admin = (TAdmin) session.get("admin");
			Xw bean = new Xw();
			bean.setDescs(descs);
			bean.setTitles(titles);
			bean.setTimes(strDate3);
			bean.setUrl("files/" + fileName);
			bean.setRealname(admin.getRealname());
			dao.save(bean);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		this.setMessage("添加成功");
		this.setPath("xwmana.action");
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
		p.setPath("xwmana.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}
	public String mana2() {

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
		p.setPath("xwmana2.action");//

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}

	public String modifybefore() {
		Xw bean = dao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("bean", bean);
		return ActionSupport.SUCCESS;
	}

	public String modify() {

		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/files");
		System.out.println("  " + image.getName());
		Date date2 = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
		String strDate3 = formatter2.format(date2);
		String fileName = "";
		Xw bean = dao.findById(id);
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
			Map session = ServletActionContext.getContext().getSession();

			bean.setDescs(descs);
			bean.setTitles(titles);
			bean.setTimes(strDate3);

			dao.merge(bean);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		this.setMessage("修改成功");
		this.setPath("xwmana.action");
		return "succeed";

	}

	public String del() {
		dao.delete(dao.findById(id));
		this.setMessage("删除成功");
		this.setPath("xwmana.action");
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

	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
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

	public XwDAO getDao() {
		return dao;
	}

	public void setDao(XwDAO dao) {
		this.dao = dao;
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

}

package com.model;

/**
 * TAdmin generated by MyEclipse Persistence Tools
 */

public class Yy implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer cid;
	private Integer uid;
	private String carnames;//
	private String unames;
	private String descs;
	private String times;
	private String sh;

	// Constructors

	/** default constructor */
	public Yy() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getDescs() {
		return descs;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getCarnames() {
		return carnames;
	}

	public void setCarnames(String carnames) {
		this.carnames = carnames;
	}

	public String getUnames() {
		return unames;
	}

	public void setUnames(String unames) {
		this.unames = unames;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	/**
	 * @return the sh
	 */
	public String getSh() {
		return sh;
	}

	/**
	 * @param sh the sh to set
	 */
	public void setSh(String sh) {
		this.sh = sh;
	}

	

}
package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.Pp;
import com.model.Car;
import com.model.TAdmin;
import com.model.Yy;

/**
 * Data access object (DAO) for domain model class TAdmin.
 * 
 * @see com.model.TAdmin
 * @author MyEclipse Persistence Tools
 */

public class CarDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CarDAO.class);

	protected void initDao() {
		// do nothing
	}

	public void save(Car transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void saveBj(Pp transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	
	public void saveYy(Yy transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	

	public void delete(Car persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public void deleteyy(Yy persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public void deletebj(Pp persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	

	public Car findById(java.lang.Integer id) {
		try {
			Car instance = (Car) getHibernateTemplate()
					.get("com.model.Car", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public Yy findYyById(java.lang.Integer id) {
		try {
			Yy instance = (Yy) getHibernateTemplate()
					.get("com.model.Yy", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	public TAdmin findTAdminById(java.lang.Integer id) {
		try {
			TAdmin instance = (TAdmin) getHibernateTemplate()
					.get("com.model.TAdmin", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public Pp findBjById(java.lang.Integer id) {
		try {
			Pp instance = (Pp) getHibernateTemplate()
					.get("com.model.Pp", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	
	public List findAll() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Car ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAlltj() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Car as model order by model.yynum  ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findAllBj() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Pp ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllYy() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Yy ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllYyByNames(String unames) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Yy as model where model.unames='"+unames+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	public List findAllXf() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Xf ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllGz() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Gz ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findAllBjByNames(String bjnames) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Pp as model where model.names='"+bjnames+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findAllStu(String stuname) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Car as model where model.stuname ='"+stuname+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}


	public List findAllCj() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Cj ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findAllCj(String  stuname) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Cj as model where model.stuname='"+stuname+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findAllQjByTimes(String times) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Qj as model where 1=1 ";
			if (times != null && !times.equals("")) {
				queryString += " and model.btimes<'" + times + "' and etimes>'"
						+ times + "'";
			} else {
				queryString += " and 1=2 ";
			}
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List findAllQj() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Qj ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllQj(String stuname) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Qj as model where model.stuname='"+stuname+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List findAllZy() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Zy ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllZy(String stuname) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Zy as model where model.stuname='"+stuname+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List findAll(String cpno, String fdjno) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Stu as model where 1=1 ";
			if (cpno != null && !cpno.equals("")) {
				queryString += " and model.cpno like '%" + cpno + "%'";
			}
			if (fdjno != null && !fdjno.equals("")) {
				queryString += " and model.fdjno like '%" + fdjno + "%'";
			}
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Car merge(Car detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			Car result = (Car) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	public Yy merge(Yy detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			Yy result = (Yy) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	public Pp merge(Pp detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			Pp result = (Pp) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}


	public static CarDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CarDAO) ctx.getBean("CarDAO");
	}
}
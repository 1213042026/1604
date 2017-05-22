package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.Zp;
import com.sun.org.apache.xpath.internal.operations.Lt;

/**
 * Data access object (DAO) for domain model class TAdmin.
 * 
 * @see com.model.TAdmin
 * @author MyEclipse Persistence Tools
 */

public class ZpDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ZpDAO.class);

	protected void initDao() {
		// do nothing
	}

	public void save(Zp transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void saveLt(Lt transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Zp persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public void deleteLt(Lt persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Zp findById(java.lang.Integer id) {
		try {
			Zp instance = (Zp) getHibernateTemplate().get(
					"com.model.Zp", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public Lt findLtById(java.lang.Integer id) {
		try {
			Lt instance = (Lt) getHibernateTemplate().get(
					"com.model.Lt", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	

	public List findAll() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Zp ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllBj() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Bj ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findAllLt() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Lt ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	

	public Zp merge(Zp detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			Zp result = (Zp) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public Lt merge(Lt detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			Lt result = (Lt) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}


	public static ZpDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ZpDAO) ctx.getBean("ZpDAO");
	}
}
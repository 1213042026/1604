package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.Xw;

/**
 * Data access object (DAO) for domain model class TAdmin.
 * 
 * @see com.model.TAdmin
 * @author MyEclipse Persistence Tools
 */

public class XwDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(XwDAO.class);

	protected void initDao() {
		// do nothing
	}

	public void save(Xw transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Xw persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Xw findById(java.lang.Integer id) {
		try {
			Xw instance = (Xw) getHibernateTemplate().get(
					"com.model.Xw", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	

	public List findAll() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Xw ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	

	public Xw merge(Xw detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			Xw result = (Xw) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}


	public static XwDAO getFromApplicationContext(ApplicationContext ctx) {
		return (XwDAO) ctx.getBean("XwDAO");
	}
}
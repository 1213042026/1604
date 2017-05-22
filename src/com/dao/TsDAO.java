package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.Ts;

/**
 * Data access object (DAO) for domain model class TAdmin.
 * 
 * @see com.model.TAdmin
 * @author MyEclipse Persistence Tools
 */

public class TsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TsDAO.class);

	protected void initDao() {
		// do nothing
	}

	public void save(Ts transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Ts persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Ts findById(java.lang.Integer id) {
		try {
			Ts instance = (Ts) getHibernateTemplate().get(
					"com.model.Ts", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	

	public List findAll() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Ts ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findAll(String stuname) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Ts as model where model.names='"+stuname+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Ts merge(Ts detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			Ts result = (Ts) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}


	public static TsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TsDAO) ctx.getBean("TsDAO");
	}
}
package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.Demo;

/**
 * Data access object (DAO) for domain model class TAdmin.
 * 
 * @see com.model.TAdmin
 * @author MyEclipse Persistence Tools
 */

public class DemoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(DemoDAO.class);

	protected void initDao() {
		// do nothing
	}

	public void save(Demo transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Demo persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Demo findById(java.lang.Integer id) {
		log.debug("getting TAdmin instance with id: " + id);
		try {
			Demo instance = (Demo) getHibernateTemplate().get(
					"com.model.Demo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public Demo findByTypes(String types) {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Demo as model where model.types='"+types+"'";
			return (Demo)getHibernateTemplate().find(queryString).get(0);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}


	public List findAll() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Demo ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	

	public Demo merge(Demo detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			Demo result = (Demo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}


	public static DemoDAO getFromApplicationContext(ApplicationContext ctx) {
		return (DemoDAO) ctx.getBean("DemoDAO");
	}
}
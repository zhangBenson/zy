package com.gogowise.repository;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.Persistable;
import com.gogowise.common.utils.Utils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Example;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.ParameterizedType;
import java.util.List;

@Transactional
@Repository("modelDao")
public class ModelDaoImpl<T extends Persistable>
		implements ModelDao<T> {

	private Class<T> persistentClass = null;
    protected static Logger logger = LogManager.getLogger(ModelDaoImpl.class.getName());

    private SessionFactory sessionFactory;

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public void flush() {
		this.getSession().flush();
	}

    public void refresh(Object object) {
		this.getSession().refresh(object);
	}

	@SuppressWarnings("unchecked")
	public List<T> findByHql(String hql) {
		return this.getSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	protected Class<T> getPersistentClass() {
		if (this.persistentClass == null) {
			this.persistentClass = (Class<T>) ((ParameterizedType) getClass()
					.getGenericSuperclass()).getActualTypeArguments()[0];
		}
		return this.persistentClass;
	}

	public void delete(T entity) {
		this.getSession().delete(entity);
		this.getSession().flush();
	}

	public T findById(int id) {
		return (T) this.getSession().get(this.getPersistentClass(), id);
	}

	@SuppressWarnings("unchecked")
	public List<T> find(DetachedCriteria criteria) {
        return criteria.getExecutableCriteria(this.getSession()).list();
	}

	@SuppressWarnings("unchecked")
	public List<T> findByExample(T object) {
        Criteria executableCriteria = (object != null ?
                this.getSession().createCriteria(object.getClass()) : this.getSession().createCriteria(object.getClass()));
        return executableCriteria.add(Example.create(object)).list();
	}

	public void saveAbstract(AbstractPersistence entity) {
		this.getSession().saveOrUpdate(entity);
	}

	public Criteria createCriteria(Class<T> clazz) {
		return this.getSession().createCriteria(clazz);
	}

	@SuppressWarnings("unchecked")
	public List<T> find(String queryString, Object... values) {
        Query query = this.getSession().createQuery(queryString);
        if (values != null) {
            for (int i = 0; i < values.length; i++) {
                query.setParameter(i, values[i]);
            }
        }
        return query.list();
	}

    public T findFist(String queryString, Object... values) {
        List<T> list = this.find(queryString, values);
        return list.size() == 0 ? null : list.get(0);
    }


	public void persist(T entity) {
        this.getSession().persist(entity);
    }

	public void persistAbstract(AbstractPersistence entity) {
		if (entity.getId() != null && entity.getId() > 0) {
			this.getSession().merge(entity);
		} else {
			this.getSession().persist(entity);
		}

	}

    public void persistAbstract(Persistable entity) {
        if (entity.getId() != null && entity.getId() > 0) {
            this.getSession().merge(entity);
        } else {
            this.getSession().persist(entity);
        }

    }

    public List find(final String hql, final Pagination pagination, final Object... values) {
        Query query = this.getSession().createQuery(hql);
        Query queryCount = this.getSession().createQuery(Utils.getCountHQLString(hql));
        if (values != null) {
            for (int i = 0; i < values.length; i++) {
                query.setParameter(i, values[i]);
                queryCount.setParameter(i, values[i]);
            }
        }
        if (pagination != null) {
            query.setFirstResult(pagination.getFirstRecord());
            query.setMaxResults(pagination.getPageSize());
        }
        List list = query.list();
        if (pagination != null) {
            List countList = queryCount.list();
            if (countList.size() == 1) {
                pagination.setTotalSize((Long) countList.get(0));
            } else if (countList.size() >1  ) {
                pagination.setTotalSize(Long.valueOf(countList.size()));
            }else {
                 pagination.setTotalSize(new Long(0));
            }
        }
        return list;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    static boolean updateOldRecord = true;
    public void persistWithSwitch(Persistable exist, Persistable newObj){
        if (exist == null ) this.persistAbstract( newObj);
        else if (!updateOldRecord) return;
        else {
            try {
                Integer id = exist.getId();
                BeanUtils.copyProperties(exist,newObj );
                exist.setId(id);
            } catch (Exception e) {
                logger.error(exist.getId()+"=================exception==================================="+e.getMessage());
                return;
            }
            this.persistAbstract(exist);
        }
    }
}

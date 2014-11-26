package com.gogowise.rep;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface ModelDao<T extends Persistable> {

    public List<T> findByHql(String hql);

    public T findById(Integer id);

    public void delete(T entity);

    public List<T> find(DetachedCriteria criteria);

    public Criteria createCriteria(Class<T> clazz);

    public List<T> find(String queryString, Object... values);

    public T findFist(String queryString, Object... values);

    public void persist(T entity);

    public void persistAbstract(AbstractPersistence entity);

    public List find(final String hql, final Pagination pagination, final Object... values);

    public void flush();

    public void refresh(Object object);

}

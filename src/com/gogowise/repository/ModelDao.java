package com.gogowise.repository;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.Pagination;
import com.gogowise.domain.Persistable;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface ModelDao<T extends Persistable> {

    public List<T> findByHql(String hql);

    public T findById(int id);

    public void delete(T entity);

    public List<T> find(DetachedCriteria criteria);

    public List<T> findByExample(T object);

    public Criteria createCriteria(Class<T> clazz);

    public List<T> find(String queryString, Object... values);

    public T findFist(String queryString, Object... values);

    public void persist(T entity);

    public void persistAbstract(AbstractPersistence entity);

    public List find(final String hql, final Pagination pagination, final Object... values);

    public void flush();

    public void refresh(Object object);

    public void persistWithSwitch(Persistable exist, Persistable newObj);

}

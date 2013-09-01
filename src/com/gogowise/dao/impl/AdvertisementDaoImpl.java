package com.gogowise.dao.impl;

import com.gogowise.dao.AdvertisementDao;
import com.gogowise.domain.Advertisement;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-6-18
 * Time: 下午2:51
 * To change this template use File | Settings | File Templates.
 */
@Repository("advertisementDao")
public class AdvertisementDaoImpl extends ModelDaoImpl<Advertisement> implements AdvertisementDao{

    public List<Advertisement> findByProvider(Integer uid) {
        String hql = "From Advertisement ad where ad.provider.id=? and ad.id = ad.fromAdvertisement.id";
        return this.find(hql,uid);
    }
}

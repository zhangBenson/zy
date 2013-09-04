package com.gogowise.dao.advertisement;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.Advertisement;

import java.util.List;

public interface AdvertisementDao extends ModelDao<Advertisement> {

    public List<Advertisement> findByProvider(Integer uid);

}

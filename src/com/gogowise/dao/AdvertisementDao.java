package com.gogowise.dao;

import com.gogowise.domain.Advertisement;

import java.util.List;

public interface AdvertisementDao extends ModelDao<Advertisement>{

    public List<Advertisement> findByProvider(Integer uid);

}

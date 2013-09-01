package com.gogowise.dao;

import com.gogowise.domain.Advertisement;
import com.gogowise.domain.AdvertisementForLive;

import java.util.List;


public interface AdvertisementForLiveDao extends ModelDao<AdvertisementForLive> {

    public List<AdvertisementForLive> findByProvider(Integer uid);

}

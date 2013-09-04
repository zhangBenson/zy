package com.gogowise.dao.advertisement;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.Advertisement;
import com.gogowise.domain.AdvertisementForLive;

import java.util.List;


public interface AdvertisementForLiveDao extends ModelDao<AdvertisementForLive> {

    public List<AdvertisementForLive> findByProvider(Integer uid);

}

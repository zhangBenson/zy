package com.gogowise.repository.live;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.live.AdvertisementForLive;

import java.util.List;


public interface AdvertisementForLiveDao extends ModelDao<AdvertisementForLive> {

    public List<AdvertisementForLive> findByProvider(Integer uid);

}

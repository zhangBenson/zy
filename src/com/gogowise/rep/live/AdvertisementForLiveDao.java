package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.domain.live.AdvertisementForLive;

import java.util.List;


public interface AdvertisementForLiveDao extends ModelDao<AdvertisementForLive> {

    public List<AdvertisementForLive> findByProvider(Integer uid);

}

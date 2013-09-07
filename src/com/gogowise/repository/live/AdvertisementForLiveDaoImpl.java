package com.gogowise.repository.live;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.live.AdvertisementForLive;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("advertisementForLiveDao")
public class AdvertisementForLiveDaoImpl extends ModelDaoImpl<AdvertisementForLive> implements AdvertisementForLiveDao{

    public List<AdvertisementForLive> findByProvider(Integer uid){
         String hql = "From AdvertisementForLive ad where ad.provider.id=? and ad.id = ad.fromAdvertisement.id";
         return this.find(hql,uid);
    }
}

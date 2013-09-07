package com.gogowise.rep.live;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.live.enity.AdvertisementForLive;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("advertisementForLiveDao")
public class AdvertisementForLiveDaoImpl extends ModelDaoImpl<AdvertisementForLive> implements AdvertisementForLiveDao{

    public List<AdvertisementForLive> findByProvider(Integer uid){
         String hql = "From AdvertisementForLive ad where ad.provider.id=? and ad.id = ad.fromAdvertisement.id";
         return this.find(hql,uid);
    }
}

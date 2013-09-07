package com.gogowise.repository.live;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.live.Advertisement;

import java.util.List;

public interface AdvertisementDao extends ModelDao<Advertisement> {

    public List<Advertisement> findByProvider(Integer uid);

}

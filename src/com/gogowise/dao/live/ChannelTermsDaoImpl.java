package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.live.ChannelTermsDao;
import com.gogowise.domain.ChannelTerms;
import org.springframework.stereotype.Repository;

@Repository("channelTermsDao")
public class ChannelTermsDaoImpl extends ModelDao.ModelDaoImpl<ChannelTerms> implements ChannelTermsDao{
}

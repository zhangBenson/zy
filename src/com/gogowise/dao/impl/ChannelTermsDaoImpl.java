package com.gogowise.dao.impl;

import com.gogowise.dao.ChannelTermsDao;
import com.gogowise.domain.ChannelTerms;
import org.springframework.stereotype.Repository;

@Repository("channelTermsDao")
public class ChannelTermsDaoImpl extends ModelDaoImpl<ChannelTerms> implements ChannelTermsDao{
}

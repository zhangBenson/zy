package com.gogowise.rep.live;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.live.enity.ChannelTerms;
import org.springframework.stereotype.Repository;

@Repository("channelTermsDao")
public class ChannelTermsDaoImpl extends ModelDaoImpl<ChannelTerms> implements ChannelTermsDao{
}

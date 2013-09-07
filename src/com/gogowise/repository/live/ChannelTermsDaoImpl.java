package com.gogowise.repository.live;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.live.ChannelTerms;
import org.springframework.stereotype.Repository;

@Repository("channelTermsDao")
public class ChannelTermsDaoImpl extends ModelDaoImpl<ChannelTerms> implements ChannelTermsDao{
}

package com.gogowise.dao.live;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.live.LiveChannelDao;
import com.gogowise.domain.ShowTerms;
import org.springframework.stereotype.Repository;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-6-11
 * Time: 下午3:17
 * To change this template use File | Settings | File Templates.
 */
@Repository("showTermsDao")
public class ShowTermsDaoImpl extends ModelDao.ModelDaoImpl<ShowTerms> implements LiveChannelDao.ShowTermsDao {
}

package com.gogowise.dao.system;

import com.gogowise.dao.ModelDao;
import com.gogowise.domain.FeedBackInfo;
import org.springframework.stereotype.Repository;

public interface FeedbackInfoDao extends ModelDao<FeedBackInfo> {
    @Repository("feedbackInfoDao")
    class FeedbackInfoDaoImpl extends ModelDaoImpl<FeedBackInfo> implements FeedbackInfoDao{
    }
}

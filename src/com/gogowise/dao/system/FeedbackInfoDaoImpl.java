package com.gogowise.dao.system;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.FeedBackInfo;
import org.springframework.stereotype.Repository;

@Repository("feedbackInfoDao")
public class FeedbackInfoDaoImpl extends ModelDaoImpl<FeedBackInfo> implements FeedbackInfoDao{
}

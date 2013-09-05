package com.gogowise.dao.impl;

import com.gogowise.dao.FeedbackInfoDao;
import com.gogowise.domain.FeedBackInfo;
import org.springframework.stereotype.Repository;

@Repository("feedbackInfoDao")
public class FeedbackInfoDaoImpl extends ModelDaoImpl<FeedBackInfo> implements FeedbackInfoDao{
}

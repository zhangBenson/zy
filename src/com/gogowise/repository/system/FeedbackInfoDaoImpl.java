package com.gogowise.repository.system;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.system.FeedBackInfo;
import org.springframework.stereotype.Repository;

@Repository("feedbackInfoDao")
public class FeedbackInfoDaoImpl extends ModelDaoImpl<FeedBackInfo> implements FeedbackInfoDao{
}

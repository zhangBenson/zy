package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.QuestionResult;

import java.util.List;

public interface QuestionResultDao extends ModelDao<QuestionResult> {
    public List<QuestionResult> findByQuestionAndClass(Integer questionId, Integer courseClassId);
}

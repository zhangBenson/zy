package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.QuestionResult;

import java.util.List;

public interface QuestionResultDao extends ModelDao<QuestionResult> {
    public List<QuestionResult> findByQuestionAndClass(Integer questionId, Integer courseClassId);

    public QuestionResult find(Integer userId, Integer questionId, Integer classId);

    public List<QuestionResult> findByClassAndUser(Integer courseClassId, Integer userID);
    public List<QuestionResult> findByCourseAndUser(Integer cId, Integer userID);
}

package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.enity.Question;
import com.gogowise.rep.course.enity.QuestionResult;

import java.util.List;

public interface QuestionResultDao extends ModelDao<QuestionResult> {
    public List<QuestionResult> findByQuestionAndClass(Integer questionId, Integer courseClassId);

    public QuestionResult find(Integer userId, Integer questionId, Integer classId);

    public List<QuestionResult> findByClassAndUser(Integer courseClassId, Integer userID);
    public List<QuestionResult> findByCourseAndUser(Integer cId, Integer userID);
    public List<QuestionResult> findByCourse(Integer cId);
    public List<QuestionResult> findByCourseClass(Integer classId);
    public List<QuestionResult> findByQuestion(Integer questionId);
    public List<Question> findQuestionsForCourse(Integer cId, Pagination pagination);

    public List<QuestionResult> findAll();
    public List<Question> findAllQuestion(Pagination pagination);
}

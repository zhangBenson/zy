package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.enity.Question;
import com.gogowise.rep.course.enity.QuestionResult;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("questionResultDao")
public class QuestionResultImpl extends ModelDaoImpl<QuestionResult> implements QuestionResultDao {
    public List<QuestionResult> findByQuestionAndClass(Integer questionId, Integer courseClassId) {
        return this.find("From QuestionResult qr where qr.question.id=?  and qr.courseClass.id = ?", questionId, courseClassId);
    }

    public QuestionResult find(Integer userId, Integer questionId, Integer classId) {
        return this.findFist("From QuestionResult cm where cm.owner.id=?   and cm.question.id = ? and cm.courseClass.id = ? order by cm.id desc", userId, questionId, classId);
    }

    public List<QuestionResult> findByClassAndUser(Integer courseClassId, Integer userID)
    {
        return this.find("From QuestionResult qr where qr.courseClass.id=?  and qr.owner.id = ? and qr.courseClass.isDeleted=false", courseClassId, userID);
    }

    public List<QuestionResult> findByCourseAndUser(Integer cId, Integer userID)
    {
        return this.find("From QuestionResult qr where qr.courseClass.course.id=?  and qr.owner.id = ? and qr.courseClass.isDeleted=false", cId, userID);
    }

    public List<QuestionResult> findByCourse(Integer cId)
    {
        return this.find("From QuestionResult qr where qr.courseClass.course.id=? and qr.courseClass.isDeleted=false", cId);
    }

    public List<QuestionResult> findByCourseClass(Integer classId){
        return this.find("From QuestionResult qr where qr.courseClass.id=? and qr.courseClass.isDeleted=false", classId);
    }

    public List<QuestionResult> findByQuestion(Integer questionId){
        return this.find("From QuestionResult qr where qr.question.id=? and qr.courseClass.isDeleted=false", questionId);
    }

    public List<Question> findQuestionsForCourse(Integer cId, Pagination pagination){
        String sql = "select distinct qr.question From QuestionResult  qr  where qr.courseClass.course.id = ?  and qr.courseClass.isDeleted=false";
        return this.find(sql, pagination,cId);
    }

    public List<QuestionResult> findAll(){
        String hql = "From QuestionResult";
        return this.find(hql);

    }

    public List<Question> findAllQuestion(Pagination pagination){
        String sql = "select distinct qr.question From QuestionResult qr";
        return this.find(sql, pagination);
    }
}

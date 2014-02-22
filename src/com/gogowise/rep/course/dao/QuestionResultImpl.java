package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
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
}

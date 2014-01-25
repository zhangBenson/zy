package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.QuestionResult;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("questionResult")
public class QuestionResultImpl extends ModelDaoImpl<QuestionResult> implements QuestionResultDao {
    public List<QuestionResult> findByQuestionAndClass(Integer questionId, Integer courseClassId) {
        return this.find("From QuestionResult qr where qr.question.id=?  and qr.courseClass.id = ?", questionId, courseClassId);
    }

}

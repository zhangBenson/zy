package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.Question;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("questionDao")
public class QuestionDaoImpl extends ModelDaoImpl<Question> implements QuestionDao {
    public List<Question> findByMaterialId(Integer materialId) {
        return this.find("From Question cm where cm.courseMaterial.id=? order by cm.id desc", materialId);
    }


}

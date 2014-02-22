package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.Question;

import java.util.List;

public interface QuestionDao extends ModelDao<Question> {
    public List<Question> findByMaterialId(Integer materialId);

}

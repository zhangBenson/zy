package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.CourseReservation;
import com.gogowise.rep.course.enity.Question;
import org.springframework.stereotype.Repository;


@Repository("questionDao")
public class QuestionDaoImpl extends ModelDaoImpl<Question> implements QuestionDao{



}

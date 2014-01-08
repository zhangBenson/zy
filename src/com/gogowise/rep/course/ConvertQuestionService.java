package com.gogowise.rep.course;

import com.gogowise.rep.course.enity.Question;

import javax.xml.bind.JAXBException;
import java.util.List;

/**
 * Created by benson on 14-1-6.
 */
public interface ConvertQuestionService {


       public List<Question> convert(String patch) throws JAXBException;

}

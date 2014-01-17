package com.gogowise.action.course.vclass;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.course.dao.QuestionDao;
import com.gogowise.rep.course.enity.Question;
import com.gogowise.rep.course.enity.QuestionItem;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = BasicAction.RESULT_JSON, type = BasicAction.RESULT_JSON)
})
public class QuestionDisplayAction extends BasicAction {


//    @JSON(serialize = false)


    private QuestionDao questionDao;
    private Integer questionId;


    private QuestionVo vo = new QuestionVo();


    @Action(value = "question")
    public String question() {
        Question question = questionDao.findById(questionId);
        vo.setDescription(question.getDescription());
        vo.setMaterialId(question.getCourseMaterial().getId());
        for (QuestionItem questionItem : question.getQuestionItems()) {
            vo.getItems().add(questionItem.getDescription());
        }
        return RESULT_JSON;
    }


    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public QuestionVo getVo() {
        return vo;
    }
}

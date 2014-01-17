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

import java.util.ArrayList;
import java.util.List;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = BasicAction.RESULT_JSON, type = BasicAction.RESULT_JSON)
})
public class QuestionListAction extends BasicAction {


//    @JSON(serialize = false)


    private QuestionDao questionDao;
    private Integer materialId;


    private List<QuestionVo> vos = new ArrayList<>();


    @Action(value = "listQuestion")
    public String listQuestion() {
        List<Question> questions = questionDao.findByMaterialId(materialId);
        vos = translate(questions);
        return RESULT_JSON;
    }

    private List<QuestionVo> translate(List<Question> questions) {
        List<QuestionVo> ret = new ArrayList<>();
        for (Question question : questions) {
            QuestionVo questionVo = new QuestionVo();
            questionVo.setDescription(question.getDescription());
            questionVo.setMaterialId(question.getCourseMaterial().getId());
            for (QuestionItem questionItem : question.getQuestionItems()) {
                questionVo.getItems().add(questionItem.getDescription());
            }

            ret.add(questionVo);
        }
        return ret;
    }

    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }

    public List<QuestionVo> getVos() {
        return vos;
    }


}

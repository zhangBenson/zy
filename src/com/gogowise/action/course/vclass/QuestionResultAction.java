package com.gogowise.action.course.vclass;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.course.dao.ClassDao;
import com.gogowise.rep.course.dao.QuestionDao;
import com.gogowise.rep.course.dao.QuestionResultDao;
import com.gogowise.rep.course.enity.Question;
import com.gogowise.rep.course.enity.QuestionItem;
import com.gogowise.rep.course.enity.QuestionResult;
import com.gogowise.rep.user.dao.BaseUserDao;
import com.gogowise.rep.user.enity.BaseUser;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class QuestionResultAction extends BasicAction {


    private QuestionResultDao questionResultDao;
    private BaseUserDao baseUserDao;
    private QuestionDao questionDao;
    private ClassDao classDao;

    private Integer courseClassId;
    private Integer questionId;
    private Integer userId;
    private String questionItemIndex;

    private Integer correctNumber;
    private Integer inCorrectNumber;


    @Action(value = "displayQuestionResult")
    public String displayCourseMaterialWithJson() {
        List<QuestionResult> questionResults = questionResultDao.findByQuestionAndClass(questionId, courseClassId);
        correctNumber = 0;
        inCorrectNumber = 0;
        for (QuestionResult qr : questionResults) {
            if (qr.getIsCorrect()) {
                correctNumber++;
            } else {
                inCorrectNumber++;
            }
        }
        return RESULT_JSON;
    }

    @Action(value = "saveQuestionResult")
    public String saveQuestionResult() {
        QuestionResult questionResult = new QuestionResult();
        Question question = questionDao.findById(questionId);
        BaseUser owner = baseUserDao.findById(userId);
        QuestionItem questionItem = null;
        for (QuestionItem item : question.getQuestionItems()) {
            if (item.getIndexValue().equals(questionItemIndex)) {
                questionItem = item;
                questionResult.setQuestionItem(questionItem);
                questionResult.setIsCorrect(questionItem.getIsAnswer());
                break;
            }
        }
        if (questionItem == null) {
            logger.error("question item is null");
            return RESULT_JSON;
        }
        questionResult.setOwner(owner);
        questionResult.setQuestion(question);
        questionResult.setCourseClass(classDao.findById(courseClassId));
        questionResultDao.persistAbstract(questionResult);
        return RESULT_JSON;

    }

    public void setClassDao(ClassDao classDao) {
        this.classDao = classDao;
    }

    public void setBaseUserDao(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    public void setQuestionItemIndex(String questionItemIndex) {
        this.questionItemIndex = questionItemIndex;
    }

    public void setCorrectNumber(Integer correctNumber) {
        this.correctNumber = correctNumber;
    }

    public void setInCorrectNumber(Integer inCorrectNumber) {
        this.inCorrectNumber = inCorrectNumber;
    }

    public void setQuestionResultDao(QuestionResultDao questionResultDao) {
        this.questionResultDao = questionResultDao;
    }

    public void setCourseClassId(Integer courseClassId) {
        this.courseClassId = courseClassId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCorrectNumber() {
        return correctNumber;
    }

    public Integer getInCorrectNumber() {
        return inCorrectNumber;
    }
}

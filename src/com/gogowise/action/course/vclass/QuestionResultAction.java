package com.gogowise.action.course.vclass;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
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
import org.apache.struts2.convention.annotation.Result;
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

    private List<Question> questions;
    private List<QuestionResult> questionResults;

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
        QuestionResult questionResult = questionResultDao.find(userId, questionId, courseClassId);
        if (questionResult == null) questionResult = new QuestionResult();
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

        //更改回答的次数情况
        question.setAnsweredNum( question.getAnsweredNum() + 1 );
        if( questionItem.getIsAnswer() ) {
            question.setAnsweredCorrectNum( question.getAnsweredCorrectNum() + 1 );
        }

        questionResultDao.persistAbstract(questionResult);
        return RESULT_JSON;

    }

    /**根据questionResult来更新question里面的answeredNum以及answeredCorrectNum字段***/
    @Action(value = "initQuestionStaticsWithOldQuestionResult", results = {@Result(name=SUCCESS, type = Constants.RESULT_NAME_TILES, location = ".index")})
    public String initQuestionStaticsWithOldQuestionResult(){
        questionResults = questionResultDao.findAll();

        for(QuestionResult questionResult : questionResults){
            Question question = questionResult.getQuestion();
            question.setAnsweredNum( question.getAnsweredNum() + 1 );

            if( questionResult.getIsCorrect() ){
                question.setAnsweredCorrectNum( question.getAnsweredCorrectNum() + 1 );
            }
            questionDao.persist(question);
        }
        return SUCCESS;
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

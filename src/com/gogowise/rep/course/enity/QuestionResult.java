package com.gogowise.rep.course.enity;


import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;


@Entity
public class QuestionResult extends AbstractPersistence {
    @ManyToOne
    private CourseClass courseClass;
    @ManyToOne
    private BaseUser owner;

    @ManyToOne
    private Question question;

    private QuestionItem questionItem;

    private Boolean isCorrect;

    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
    }

    public BaseUser getOwner() {
        return owner;
    }

    public void setOwner(BaseUser owner) {
        this.owner = owner;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public QuestionItem getQuestionItem() {
        return questionItem;
    }

    public void setQuestionItem(QuestionItem questionItem) {
        this.questionItem = questionItem;
    }

    public Boolean getIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(Boolean isCorrect) {
        this.isCorrect = isCorrect;
    }
}

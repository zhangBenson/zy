package com.gogowise.rep.course.enity;


import com.gogowise.rep.AbstractPersistence;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;


@Entity
public class Question extends AbstractPersistence {
    private String description;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "question")
    private List<QuestionItem> questionItems = new ArrayList<>();

    @ManyToOne
    private CourseMaterial courseMaterial;

    private Integer answeredNum = 0;
    private Integer answeredCorrectNum = 0;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<QuestionItem> getQuestionItems() {
        return questionItems;
    }

    public void setQuestionItems(List<QuestionItem> questionItems) {
        this.questionItems = questionItems;
    }

    public void addQuestionItems(QuestionItem questionItem) {
        this.questionItems.add(questionItem);
    }

    public CourseMaterial getCourseMaterial() {
        return courseMaterial;
    }

    public void setCourseMaterial(CourseMaterial courseMaterial) {
        this.courseMaterial = courseMaterial;
    }

    public String getAnswer() {
        for (QuestionItem item : this.getQuestionItems()) {
            if (item.getIsAnswer())
                return item.getIndexValue();
        }
        return null;

    }

    public Integer getAnsweredNum() {
        return answeredNum;
    }

    public void setAnsweredNum(Integer answeredNum) {
        this.answeredNum = answeredNum;
    }

    public Integer getAnsweredCorrectNum() {
        return answeredCorrectNum;
    }

    public void setAnsweredCorrectNum(Integer answeredCorrectNum) {
        this.answeredCorrectNum = answeredCorrectNum;
    }

    public double getAnsweredAccurcy() {
        return answeredNum == 0 ? 0 : answeredCorrectNum * 1.0 / answeredNum;
    }
}

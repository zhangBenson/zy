package com.gogowise.rep.course.enity;


import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;


@Entity
public class QuestionItem extends AbstractPersistence {
    private String description;
    private String index;

    private Boolean isAnswer;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getIsAnswer() {
        return isAnswer;
    }

    public void setIsAnswer(Boolean isAnswer) {
        this.isAnswer = isAnswer;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }
}

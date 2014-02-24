package com.gogowise.rep.course.enity;


import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.List;


@Entity
public class Question extends AbstractPersistence {
    private String description;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "question")
    private List<QuestionItem> questionItems;

    @ManyToOne
    private CourseMaterial courseMaterial;

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

    public CourseMaterial getCourseMaterial() {
        return courseMaterial;
    }

    public void setCourseMaterial(CourseMaterial courseMaterial) {
        this.courseMaterial = courseMaterial;
    }

    public String getAnswer() {
        for (QuestionItem item :this.getQuestionItems()) {
            if (item.getIsAnswer())
                return item.getIndexValue();
        }
        return null;

    }
}

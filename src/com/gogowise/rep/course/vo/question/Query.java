package com.gogowise.rep.course.vo.question;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by benson on 14-1-6.
 */
public class Query {

    private String question;


    private String answer;

    private String img;

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer.trim();
    }

    private List<String> items;


    @XmlElement(name="item")
    public List<String> getItems() {
        return items;
    }


    public void setItems(List<String> items) {
        this.items = new ArrayList<>();
        for (String item : items) {
            this.items.add(item.trim()) ;
        }
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}

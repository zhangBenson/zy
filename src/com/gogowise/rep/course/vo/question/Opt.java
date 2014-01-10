package com.gogowise.rep.course.vo.question;

import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by benson on 14-1-6.
 */
public class Opt {

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
}

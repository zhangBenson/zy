package com.gogowise.rep.tag.enity;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-15 15:16
 * Email: jhji@ir.hit.edu.cn
 */
@Entity
public class Tag extends AbstractPersistence {

    private String name;
    private String description;
    private Boolean isDeleted = false;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
}

package com.gogowise.domain;

import javax.persistence.Entity;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-11-21
 * Time: 上午1:17
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class IEMI extends AbstractPersistence{
    private String iemiString;

    public String getIemiString() {
        return iemiString;
    }

    public void setIemiString(String iemiString) {
        this.iemiString = iemiString;
    }
}

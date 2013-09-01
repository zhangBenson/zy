package com.gogowise.domain;

import javax.persistence.Entity;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-10-4
 * Time: 下午5:05
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class AndroidFeedback extends AbstractPersistence {
    private String email;
    private String content;
    private boolean done;

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

package com.gogowise.rep.android.enity;

import com.gogowise.domain.AbstractPersistence;
import com.gogowise.domain.live.PersonalOnlive;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-11-16
 * Time: 下午9:33
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class ValidUser extends AbstractPersistence {
    private Integer userId;

    @OneToOne
    private PersonalOnlive personalOnlive;

    private Calendar watchTime=Calendar.getInstance();

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public PersonalOnlive getPersonalOnlive() {
        return personalOnlive;
    }

    public void setPersonalOnlive(PersonalOnlive personalOnlive) {
        this.personalOnlive = personalOnlive;
    }
}

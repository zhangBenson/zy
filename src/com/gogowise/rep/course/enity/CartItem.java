package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 * Created by Administrator on 2014/8/25.
 */
@Entity
public class CartItem  extends AbstractPersistence {

    @OneToOne
    private  Course  course ;

    private Integer count ;

    @ManyToOne
    private ShoppingCart shoppingcart;

    public void setCourse(Course course) {
        this.course = course;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Course getCourse() {
        return course;
    }

    public Integer getCount() {
        return count;
    }

    public ShoppingCart getShoppingcart() {
        return shoppingcart;
    }

    public void setShoppingcart(ShoppingCart shoppingcart) {
        this.shoppingcart = shoppingcart;
    }
}

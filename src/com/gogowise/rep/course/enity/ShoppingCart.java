package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.enity.BaseUser;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2014/8/25.
 */
@Entity
public class ShoppingCart extends AbstractPersistence {


    @OneToOne
    private BaseUser user;

    @OneToMany(mappedBy = "shoppingcart")
    private List<CartItem> cartItems = new ArrayList<CartItem>();

    public BaseUser getUser() {
        return user;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setUser(BaseUser user) {
        this.user = user;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }
}

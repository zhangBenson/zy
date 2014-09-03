package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.course.enity.ShoppingCart;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2014/9/1.
 */
@Repository("shoppingCartDao")
public class ShoppingCartDaoImpl extends ModelDaoImpl<ShoppingCart> implements ShoppingCartDao {


    @Override
    public void saveShoppingCar(ShoppingCart shoppingCart) {

        this.persist(shoppingCart);
    }

    @Override
    public void delShoppingCar(Integer ShoppingCartId) {

        this.delete(this.findById(ShoppingCartId));

    }
}

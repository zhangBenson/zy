package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.course.enity.PaypalDetails;
import com.gogowise.rep.course.enity.ShoppingCart;

/**
 * Created by Administrator on 2014/9/1.
 */
public interface ShoppingCartDao  extends ModelDao<ShoppingCart> {

    public void saveShoppingCar(ShoppingCart shoppingCart);

    public void delShoppingCar(Integer ShoppingCartId);


}

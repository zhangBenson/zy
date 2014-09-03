package com.gogowise.rep.course;

import com.gogowise.rep.ModelService;
import com.gogowise.rep.course.enity.ShoppingCart;

/**
 * Created by Administrator on 2014/9/1.
 */
public interface ShoppingCartService extends ModelService {

    public void saveShoppingCar(ShoppingCart shoppingCart);

    public void delShoppingCar(Integer ShoppingCartId);

}

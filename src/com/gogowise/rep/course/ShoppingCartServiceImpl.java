package com.gogowise.rep.course;

import com.gogowise.rep.ModelServiceImpl;
import com.gogowise.rep.course.dao.PaypalDao;
import com.gogowise.rep.course.dao.ShoppingCartDao;
import com.gogowise.rep.course.enity.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2014/9/1.
 */
@Service("shoppingCartService")
public class ShoppingCartServiceImpl extends ModelServiceImpl implements ShoppingCartService{

    @Autowired
    private ShoppingCartDao shoppingCartDao;


    @Override
    public void saveShoppingCar(ShoppingCart shoppingCart) {
        shoppingCartDao.saveShoppingCar(shoppingCart);
    }

    @Override
    public void delShoppingCar(Integer ShoppingCartId) {
        shoppingCartDao.delShoppingCar(ShoppingCartId);
    }
}

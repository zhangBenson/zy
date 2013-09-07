package com.gogowise.rep.android;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.android.enity.ValidUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-11-16
 * Time: 下午9:44
 * To change this template use File | Settings | File Templates.
 */
@Repository("validUserDao")
public class ValidUserDaoImpl  extends ModelDaoImpl<ValidUser> implements ValidUserDao {
      public List<ValidUser> findAll(){
          return this.findAll();
      }

}

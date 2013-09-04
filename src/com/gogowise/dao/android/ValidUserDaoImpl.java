package com.gogowise.dao.android;

import com.gogowise.dao.ModelDao;
import com.gogowise.dao.live.LiveTermCommentDao;
import com.gogowise.domain.ValidUser;
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
public class ValidUserDaoImpl  extends ModelDao.ModelDaoImpl<ValidUser> implements LiveTermCommentDao.ValidUserDao {
      public List<ValidUser> findAll(){
          return this.findAll();
      }

}

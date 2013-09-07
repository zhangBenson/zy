package com.gogowise.rep.android;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-10-4
 * Time: 下午5:30
 * To change this template use File | Settings | File Templates.
 */

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.android.enity.AndroidFeedback;
import org.springframework.stereotype.Repository;


@Repository("androidFeedbackDao")
public class AndroidFeedbackDaoImpl extends ModelDaoImpl<AndroidFeedback> implements AndroidFeedbackDao{
   public void saveAndroidFeedback(AndroidFeedback androidFeedback){
          if(androidFeedback!=null){
              this.persistAbstract(androidFeedback);
          }
   }


}

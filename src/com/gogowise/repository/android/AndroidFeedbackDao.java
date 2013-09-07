package com.gogowise.repository.android;

import com.gogowise.repository.ModelDao;
import com.gogowise.domain.android_domain.AndroidFeedback;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-10-4
 * Time: 下午5:25
 * To change this template use File | Settings | File Templates.
 */
public interface AndroidFeedbackDao extends ModelDao<AndroidFeedback> {
       public void saveAndroidFeedback(AndroidFeedback androidFeedback);


}

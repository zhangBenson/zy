package com.gogowise.dao.impl;

import com.gogowise.dao.UserTaskDao;
import com.gogowise.domain.UserTask;
import org.springframework.stereotype.Repository;

@Repository("UserTaskDao")
public class UserTaskDaoImpl extends ModelDaoImpl<UserTask> implements UserTaskDao {
     public void closeTask(Integer taskId) {
         UserTask userTask  = this.findById(taskId);
         userTask.setClosed(true);
         this.persistAbstract(userTask);
     }

    public void createTask(UserTask userTask) {
        this.persistAbstract(userTask);
    }

}

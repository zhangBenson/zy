package com.gogowise.rep.user;


import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.user.UserTask;

public interface UserTaskDao extends ModelDao<UserTask> {
    public void closeTask(Integer taskId);

    public void createTask(UserTask userTask);
}

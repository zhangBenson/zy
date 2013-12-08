package com.gogowise.rep.user.dao;


import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.enity.UserTask;

public interface UserTaskDao extends ModelDao<UserTask> {
    public void closeTask(Integer taskId);

    public void createTask(UserTask userTask);
}

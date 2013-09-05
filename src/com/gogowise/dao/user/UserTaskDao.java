package com.gogowise.dao.user;


import com.gogowise.dao.ModelDao;
import com.gogowise.domain.UserTask;

public interface UserTaskDao extends ModelDao<UserTask> {
    public void closeTask(Integer taskId);

    public void createTask(UserTask userTask);
}

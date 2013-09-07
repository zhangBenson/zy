package com.gogowise.repository.user;


import com.gogowise.repository.ModelDao;
import com.gogowise.domain.user.UserTask;

public interface UserTaskDao extends ModelDao<UserTask> {
    public void closeTask(Integer taskId);

    public void createTask(UserTask userTask);
}

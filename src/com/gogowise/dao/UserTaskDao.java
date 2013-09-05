package com.gogowise.dao;


import com.gogowise.domain.UserTask;

public interface UserTaskDao extends ModelDao<UserTask>{
    public void closeTask(Integer taskId);

    public void createTask(UserTask userTask);
}

package com.gogowise.rep.user.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("groupDao")
public class GroupDaoImpl extends ModelDaoImpl<Group> implements GroupDao {

    @Autowired
    private BaseUserDao baseUserDao;

    public void removeStudents(Integer groupId, List<Integer> ids) {

        Group group = this.findById(groupId);
        for (Integer userId : ids) {
            BaseUser currentUser = baseUserDao.findById(userId);
            group.removeStudent(currentUser);
        }

    }

    public void addStudents(Integer groupId, List<Integer> ids) {

        Group group = this.findById(groupId);
        for (Integer userId : ids) {
            BaseUser currentUser = baseUserDao.findById(userId);
            group.addStudent(currentUser);
        }

    }



}

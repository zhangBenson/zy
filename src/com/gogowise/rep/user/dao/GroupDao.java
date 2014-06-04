package com.gogowise.rep.user.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.user.enity.Group;

import java.util.List;

public interface GroupDao extends ModelDao<Group> {

    public void removeStudents(Integer groupId, List<Integer> ids);

    public void addStudents(Integer groupId, List<Integer> ids);

}

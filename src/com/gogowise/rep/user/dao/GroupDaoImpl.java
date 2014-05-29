package com.gogowise.rep.user.dao;

import java.util.List;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.enity.Group;
import com.gogowise.rep.user.enity.RoleType;
import org.springframework.stereotype.Repository;

@Repository("groupDao")
public class GroupDaoImpl extends ModelDaoImpl<Group> implements GroupDao {
}

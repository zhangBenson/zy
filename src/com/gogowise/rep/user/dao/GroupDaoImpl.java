package com.gogowise.rep.user.dao;

import java.util.List;

import com.gogowise.rep.course.dao.CourseDao;
import com.gogowise.rep.course.enity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.user.enity.Group;

@Repository("groupDao")
public class GroupDaoImpl extends ModelDaoImpl<Group> implements GroupDao {

    @Autowired
    private BaseUserDao baseUserDao;

    @Autowired
    private CourseDao courseDao;

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

    public void removeCourses(Integer groupId, List<Integer> ids) {

        Group group = this.findById(groupId);
        for (Integer userId : ids) {
            Course curr = courseDao.findById(userId);
            group.removeCourse(curr);
        }

    }

    public void addCourses(Integer groupId, List<Integer> ids) {

        Group group = this.findById(groupId);
        for (Integer userId : ids) {
            Course curr = courseDao.findById(userId);
            group.addCourse(curr);
        }

    }

}

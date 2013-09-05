package com.gogowise.dao.course;

import com.gogowise.dao.ModelDaoImpl;
import com.gogowise.domain.BrowsedCourse;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("browsedCourseDao")
public class BrowsedCourseImpl extends ModelDaoImpl<BrowsedCourse> implements BrowsedCourseDao {
      public List<BrowsedCourse> findByUserId(Integer userId){
          return this.find("select bc from BrowsedCourse bc where bc.owner.id = ?", userId);
      }

}

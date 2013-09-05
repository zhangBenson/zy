package com.gogowise.dao.course;


import com.gogowise.dao.ModelDao;
import com.gogowise.domain.ClassRoom;
import com.gogowise.domain.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-3
 * Time: 上午10:12
 * To change this template use File | Settings | File Templates.
 */
public interface ClassRoomDao extends ModelDao<ClassRoom> {

    public void saveStudentforClassRoom(ClassRoom classRoom);

    public ClassRoom findClassRoomByCourseAndStudent(Integer cid,Integer sid);

   public List<ClassRoom> findClassRoomByCourseId(Pagination pagination,Integer id);

}

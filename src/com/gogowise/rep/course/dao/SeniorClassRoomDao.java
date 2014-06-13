package com.gogowise.rep.course.dao;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.Pagination;
import com.gogowise.rep.course.enity.SeniorClassRoom;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-4
 * Time: 下午6:43
 * To change this template use File | Settings | File Templates.
 */
public interface SeniorClassRoomDao extends ModelDao<SeniorClassRoom> {

    public void saveStudentforSeniorClassRoom(SeniorClassRoom seniorClassRoom);

    public SeniorClassRoom findClassRoomByCourseAndStudent(Integer cid, Integer sid);

    public List<SeniorClassRoom> findClassRoomByCourseId(Integer cid);

    public List<SeniorClassRoom> findAllClassRoomByUser(Pagination pagination, Integer userId);

    public void saveSeniorClassRoom(Integer courseId, Integer userId);

    public String deleteSeniorClassRoom(Integer cid, Integer uid);
}

package com.gogowise.rep.live;

import com.gogowise.rep.ModelDao;
import com.gogowise.rep.live.live.MyShow;
import com.gogowise.rep.Pagination;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-6-11
 * Time: 下午3:14
 * To change this template use File | Settings | File Templates.
 */
public interface MyShowDao extends ModelDao<MyShow> {

    public void saveFirstShowTerm(MyShow myShow);

    public void manageMyShow(MyShow oldShow, MyShow newShow);

    public List<MyShow> findByUser(Integer uid,Pagination pagination);

    public List<MyShow> findHotestShow(Pagination pagination);

    public List<MyShow> findByInviteNum(Pagination pagination);

    public String saveFansForShow(Integer uid,MyShow myShow);

    public List<MyShow> findAllByUser(Integer uid,Pagination pagination);

    public List<MyShow> findUserFocusedShows(Integer userID , Pagination pagination);

    public List<MyShow> findByShowName(String showName);

    public List<MyShow> findShowOnline(Pagination pagination);

    public List<MyShow> findLatestShows(Pagination pagination);

    public List<MyShow> searchShows(String searchStr , Pagination pagination);

}

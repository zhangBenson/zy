package com.gogowise.rep.org;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.domain.org.Interview;
import com.gogowise.domain.Pagination;
import org.springframework.stereotype.Repository;

import java.util.Calendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-1
 * Time: 上午10:36
 * To change this template use File | Settings | File Templates.
 */
@Repository("interviewDao")
public class InterviewDaoImpl extends ModelDaoImpl<Interview> implements InterviewDao{

    public List<Interview> findByUser(Integer uid,Pagination pagination) {
        String hql = "select distinct i From Interview i join i.interviewAppointers ir where i.startTime>? and ( i.interviewer.id=? or ir.interviewee.id=?) order by i.startTime asc";
        Calendar calendar = Calendar.getInstance();
       // calendar.add(Calendar.HOUR_OF_DAY,-1);
        calendar.add(Calendar.MINUTE,-30);
        return this.find(hql,pagination,calendar,uid,uid);

    }
}

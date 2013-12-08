package com.gogowise.rep.org.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.org.enity.InterviewAppointer;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-1
 * Time: 下午4:50
 * To change this template use File | Settings | File Templates.
 */
@Repository("interviewAppointerDao")
public class InterviewAppointerDaoImpl extends ModelDaoImpl<InterviewAppointer> implements InterviewAppointerDao{
    public List<InterviewAppointer> findByInterview(Integer interviewId) {
        return this.find("From InterviewAppointer ia where ia.interview.id=?",interviewId);
    }

    public InterviewAppointer findByInterviewAndUser(Integer interviewId, String userEmail) {
        List<InterviewAppointer> interviewAppointers = this.find("From InterviewAppointer ia where ia.interview.id=? and ia.intervieweeEmail=?",interviewId,userEmail);
        if(interviewAppointers.size() == 0){
            return null;
        }
        return interviewAppointers.get(0);
    }
}

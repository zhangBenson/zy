package com.gogowise.rep.system.dao;

import com.gogowise.rep.ModelDaoImpl;
import com.gogowise.rep.system.enity.Matter;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: AN
 * Date: 12-6-16
 * Time: 下午3:50
 * To change this template use File | Settings | File Templates.
 */
@Repository("matterDao")
public class MatterDaoImpl extends ModelDaoImpl<Matter> implements MatterDao {


    public List<Matter> findByToEmail(String toEmail) {
        return this.find("from Matter m where m.toEmail=? and m.done=false", toEmail);
    }

    public Integer getMatterCount(String toEmail) {
        return this.find("from Matter m where m.toEmail=? and m.done=false", toEmail).size();
    }

    public Matter findBySerialNo(String serialNo) {
        List<Matter> temp = new ArrayList<Matter>();
        temp = this.find("from Matter m where m.serialNo=?", serialNo);
        if (temp.size() != 0) {
            return temp.get(0);
        }
        return null;
    }


}

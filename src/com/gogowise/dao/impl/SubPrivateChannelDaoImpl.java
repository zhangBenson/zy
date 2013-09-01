package com.gogowise.dao.impl;

import com.gogowise.dao.SubPrivateChannelDao;
import com.gogowise.domain.SubPrivateChannel;
import com.gogowise.domain.UserPrivateChannel;
import org.springframework.stereotype.Repository;

import java.util.Calendar;


@Repository("subPrivateChannelDao")
public class SubPrivateChannelDaoImpl extends ModelDaoImpl<SubPrivateChannel> implements SubPrivateChannelDao{

    public SubPrivateChannel findByParentAndChannelID(UserPrivateChannel userPrivateChannel, Integer subChannelID) {
        String hql = "From SubPrivateChannel spc where spc.userPrivateChannel.id=? and spc.subChannelNum = ?";
        SubPrivateChannel spc = this.findFist(hql,userPrivateChannel.getId(),subChannelID);
        if(spc == null){
            spc = new SubPrivateChannel();
            spc.setUserPrivateChannel(userPrivateChannel);
            spc.setName("子频道" + subChannelID);
            spc.setSubChannelNum(subChannelID);
        }
        //spc.setOpenTime(Calendar.getInstance());
        //spc.setFlagUpdateTime(Calendar.getInstance());
        this.persistAbstract(spc);
        return spc;
    }

    public SubPrivateChannel findByUserChannelAndSubChannel(Integer userPrivateChannelID, Integer subChannelNum){
       String hql = "From SubPrivateChannel spc where spc.userPrivateChannel.id=? and spc.subChannelNum = ?";
       return this.findFist(hql,userPrivateChannelID,subChannelNum);
    }
}

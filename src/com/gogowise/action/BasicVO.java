package com.gogowise.action;


import com.gogowise.common.utils.Utils;
import com.gogowise.rep.AbstractPersistence;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class BasicVO{

    protected static Logger LOGGER = LogManager.getLogger(BasicVO.class);

    public void copy(AbstractPersistence entity) {
        try {
            Utils.doCopy(this, entity);
        } catch (Exception e) {
            LOGGER.error("error in copy", e);
        }
    }


}

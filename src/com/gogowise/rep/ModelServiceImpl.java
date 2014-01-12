package com.gogowise.rep;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("modelService")
public class ModelServiceImpl implements ModelService {
    protected Logger logger = LogManager.getLogger(this.getClass());
    private ModelDao modelDao;

    public void setModelDao(ModelDao modelDao) {
        this.modelDao = modelDao;
    }
}

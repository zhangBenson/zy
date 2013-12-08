package com.gogowise.rep;

import org.springframework.stereotype.Service;

@Service("modelService")
public class ModelServiceImpl implements ModelService {
    private ModelDao modelDao;

    public void setModelDao(ModelDao modelDao) {
        this.modelDao = modelDao;
    }
}

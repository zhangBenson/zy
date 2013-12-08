package com.gogowise.rep;

import org.springframework.stereotype.Service;

@Service("modelService")
public class ModelServiceImpl implements ModelService {
    private ModelService modelService;

    public void setModelService(ModelService modelService) {
        this.modelService = modelService;
    }
}

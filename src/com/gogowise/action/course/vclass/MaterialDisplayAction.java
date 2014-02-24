package com.gogowise.action.course.vclass;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.course.dao.CourseMaterialDao;
import com.gogowise.rep.course.enity.CourseMaterial;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = BasicAction.RESULT_JSON, type = BasicAction.RESULT_JSON)
})
public class MaterialDisplayAction extends BasicAction {


//    @JSON(serialize = false)


    private CourseMaterialDao courseMaterialDao;

    private Integer materialId;

    private MaterialVo voInfo = new MaterialVo();

    @Action(value = "material")
    public String material() {
        CourseMaterial courseMaterial = courseMaterialDao.findById(materialId);
        Utils.doCopy(voInfo, courseMaterial);
        return RESULT_JSON;
    }

    public MaterialVo getVoInfo() {
        return voInfo;
    }

    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }

    public void setCourseMaterialDao(CourseMaterialDao courseMaterialDao) {
        this.courseMaterialDao = courseMaterialDao;
    }
}

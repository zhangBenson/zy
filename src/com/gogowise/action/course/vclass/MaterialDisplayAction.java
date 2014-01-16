package com.gogowise.action.course.vclass;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.course.dao.CourseMaterialDao;
import com.gogowise.rep.course.enity.CourseMaterial;
import org.apache.commons.beanutils.PropertyUtils;
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
    private Integer courseId;
    private Integer typeId;


    private List<MaterialVo> vos = new ArrayList<>();


    @Action(value = "listMaterial")
    public String listMaterial() {
        List<CourseMaterial> courseMaterials = courseMaterialDao.find(courseId, typeId);
        vos = translate(courseMaterials);
        return RESULT_JSON;
    }

    private List<MaterialVo> translate(List<CourseMaterial> courseMaterials) {
        List<MaterialVo> ret = new ArrayList<>();
        for (CourseMaterial courseMaterial : courseMaterials) {
            MaterialVo vo = new MaterialVo();
            Utils.doCopy(vo, courseMaterial);
            ret.add(vo);
        }
        return ret;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public List<MaterialVo> getVos() {
        return vos;
    }

    public void setCourseMaterialDao(CourseMaterialDao courseMaterialDao) {
        this.courseMaterialDao = courseMaterialDao;
    }
}

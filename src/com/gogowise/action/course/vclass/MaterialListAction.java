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

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;


@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = BasicAction.RESULT_JSON, type = BasicAction.RESULT_JSON)
})
public class MaterialListAction extends BasicAction {


//    @JSON(serialize = false)


    private CourseMaterialDao courseMaterialDao;
    private Integer courseId;
    private Integer typeId;


    private List<MaterialVo> vos = new ArrayList<>();
    private MaterialVo voInfo ;

    @Action(value = "listMaterial")
    public String listMaterial() throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        List<CourseMaterial> courseMaterials = courseMaterialDao.find(courseId, typeId);
        vos = translate(courseMaterials);
        return RESULT_JSON;
    }

    private List<MaterialVo> translate(List<CourseMaterial> courseMaterials) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {
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

    public MaterialVo getVoInfo() {
        return voInfo;
    }

    public void setVoInfo(MaterialVo voInfo) {
        this.voInfo = voInfo;
    }

    public void setCourseMaterialDao(CourseMaterialDao courseMaterialDao) {
        this.courseMaterialDao = courseMaterialDao;
    }
}

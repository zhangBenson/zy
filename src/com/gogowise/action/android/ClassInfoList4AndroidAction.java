package com.gogowise.action.android;

import com.gogowise.action.BasicAction;
import com.gogowise.rep.course.ClassInfoDao;
import com.gogowise.urlfetch.sk.ClassInfo;
import com.gogowise.domain.Pagination;
import com.gogowise.rep.android.enity.ClassInfo4Android;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: AN
 * Date: 13-4-6
 * Time: 下午8:31
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Results({
        @Result(name = "json", type = "json")
})
public class ClassInfoList4AndroidAction extends BasicAction{
    private ClassInfoDao classInfoDao;
    private List<ClassInfo4Android> classList;
    private Integer page;

    @Action(value = "classInfoList4Android")
    public String classInfoList(){
       Integer  basePage=6;
       Pagination p=new Pagination(basePage*this.getPage());

       List<ClassInfo> list = classInfoDao.findClassIfoByPage(p) ;
       classList =new ArrayList<ClassInfo4Android>();
       for(int i=0;i<list.size();i++){
           ClassInfo4Android classInfo4Android =new ClassInfo4Android();
           ClassInfo c=list.get(i);
           classInfo4Android.setId(c.getId());
           classInfo4Android.setClassType(c.getClassType().getName());
           classInfo4Android.setParentType(c.getClassType().getParent().getName());
           classInfo4Android.setName(c.getName());
           classInfo4Android.setPrice(c.getPrice());
           classInfo4Android.setSchoolId(c.getId());
           classInfo4Android.setSchoolName(c.getSchool().getName());
           classInfo4Android.setSchoolLogoUrl(c.getSchool().getLogUrl());
           classList.add(classInfo4Android);
       }
       return "json";
    }

    @JSON(serialize = false)
    public ClassInfoDao getClassInfoDao() {
        return classInfoDao;
    }

    public void setClassInfoDao(ClassInfoDao classInfoDao) {
        this.classInfoDao = classInfoDao;
    }

    public List<ClassInfo4Android> getClassList() {
        return classList;
    }

    public void setClassList(List<ClassInfo4Android> classList) {
        this.classList = classList;
    }


    @JSON(serialize = false)
    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }
}

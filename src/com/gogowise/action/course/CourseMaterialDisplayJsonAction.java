package com.gogowise.action.course;

import com.gogowise.action.BasicAction;
import com.gogowise.action.valueobject.ClassSession;
import com.gogowise.action.valueobject.CourseMatrixVO;
import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.course.CourseDao;
import com.gogowise.rep.course.CourseMaterialDao;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseMaterial;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.CompactWriter;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-23
 * Time: 下午3:05
 * To change this template use File | Settings | File Templates.
 */

@Controller
@Namespace(BasicAction.BASE_NAME_SPACE)
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class CourseMaterialDisplayJsonAction extends BasicAction {
    /**
     *
     */
    private static final long serialVersionUID = 2466562905933168403L;


    private CourseMaterialDao courseMaterialDao;

    private Integer courseId;
    private Integer courseClassId;

    @Action(value = "displayCourseMaterialWithJson")
    public void displayCourseMaterialWithJson() throws IOException {
        List<CourseMaterial> courseMaterials;
        if (courseClassId != null) {
            courseMaterials = courseMaterialDao.findByCourseClassId(null, courseClassId);
        } else {
            courseMaterials = courseMaterialDao.findByCourseId(null, courseId);
        }
        String outputString = "<ppts>";
        if (courseMaterials != null) {
            for (CourseMaterial courseMaterial : courseMaterials) {
                CourseMatrixVO vo = new CourseMatrixVO();
                vo.init(courseMaterial);
                OutputStream output = new ByteArrayOutputStream();
                XStream xstream = new XStream();
                xstream.alias("ppt", CourseMatrixVO.class);
                xstream.marshal(vo, new CompactWriter(new OutputStreamWriter(output)));
                outputString += output.toString();
            }
        }
        outputString += "</ppts>";
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.write(outputString);
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public void setCourseClassId(Integer courseClassId) {
        this.courseClassId = courseClassId;
    }

    @JSON(serialize = false)
    public CourseMaterialDao getCourseMaterialDao() {
        return courseMaterialDao;
    }

    public void setCourseMaterialDao(CourseMaterialDao courseMaterialDao) {
        this.courseMaterialDao = courseMaterialDao;
    }

}

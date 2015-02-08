package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;


@Entity
public class CourseMaterial extends AbstractPersistence {
    public static final int VIDEO = 1;
    public static final int DOC = 2;
    public static final int QUESTION = 3;
    public static final int PPT = 4;
    public static final int OTHER = 0;

    private static final Map<Integer, String> TYPE_MAP = new HashMap<>();

    static {
        TYPE_MAP.put(VIDEO, "VIDEO");
        TYPE_MAP.put(DOC, "DOC");
        TYPE_MAP.put(QUESTION, "QUESTION");
        TYPE_MAP.put(OTHER, "OTHER");
        TYPE_MAP.put(PPT, "PPT");
    }

    @ManyToOne
    private Course course;
    @ManyToOne
    private CourseClass courseClass;
    private int type = 0;
    private String description;
    private Calendar uploadTime;
    private String fullPath;
    private String sourceTitle;
    private Double fullSize = 0.0;
    private Integer totalPages;
    private String convertPath;
    private Boolean isDisplay;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getSourceTitle() {
        return sourceTitle;
    }

    public void setSourceTitle(String sourceTitle) {
        this.sourceTitle = sourceTitle;
    }

    public String getFullPath() {

        return fullPath;
    }

    public void setFullPath(String fullPath) {
        this.fullPath = fullPath;
    }


    public String getDescription() {

        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getFullSize() {
        return fullSize;
    }

    public void setFullSize(Double fullSize) {
        this.fullSize = fullSize;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Calendar getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Calendar uploadTime) {
        this.uploadTime = uploadTime;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public String getConvertPath() {
        return convertPath;
    }

    public void setConvertPath(String convertPath) {
        this.convertPath = convertPath;
    }

    public CourseClass getCourseClass() {
        return courseClass;
    }

    public void setCourseClass(CourseClass courseClass) {
        this.courseClass = courseClass;
        this.course = courseClass.getCourse();
    }

    public String getTypeString() {
        return TYPE_MAP.get(this.getType());
    }

    public Boolean getIsDisplay() {
        return isDisplay;
    }

    public void setIsDisplay(Boolean isDisplay) {
        this.isDisplay = isDisplay;
    }

    public static Integer getTypeByString(String extName) {
        if( extName.startsWith(".") ){
            extName = extName.substring(1);
        }
        if( extName.equalsIgnoreCase("docx") || extName.equalsIgnoreCase("pptx")
         || extName.equalsIgnoreCase("xlsx"))
        {
            extName = extName.substring(0, extName.length() -1);
        }

        for( Integer type:TYPE_MAP.keySet() ){
            String value = TYPE_MAP.get(type);
            if( value.equalsIgnoreCase(extName) ) {
                return type;
            }
        }

        return OTHER;
    }
}

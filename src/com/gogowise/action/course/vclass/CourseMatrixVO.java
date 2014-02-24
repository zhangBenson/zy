package com.gogowise.action.course.vclass;

import com.gogowise.common.utils.Constants;
import com.gogowise.common.utils.Utils;
import com.gogowise.rep.course.enity.CourseMaterial;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-4
 * Time: 下午1:17
 * To change this template use File | Settings | File Templates.
 */
public class CourseMatrixVO {

    private String description = Constants.DEFAULT_BLANK_VALUE;
    private String uploadTime = Constants.DEFAULT_BLANK_VALUE;
    private String sourceTitle = Constants.DEFAULT_BLANK_VALUE;
    private String totalPages = Constants.DEFAULT_BLANK_VALUE;
    private String convertPath;

    //===========getter and setter===========


    public void init(CourseMaterial courseMaterial) {
        this.description = Utils.getEmptyString(courseMaterial.getDescription());
        this.uploadTime = Utils.getEmptyString(courseMaterial.getUploadTime().getTime() + "");
        this.sourceTitle = Utils.getEmptyString(courseMaterial.getSourceTitle());
        this.totalPages = Utils.getEmptyString(courseMaterial.getTotalPages() + "");
        this.convertPath = Utils.getEmptyString(courseMaterial.getConvertPath());
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(String uploadTime) {
        this.uploadTime = uploadTime;
    }

    public String getSourceTitle() {
        return sourceTitle;
    }

    public void setSourceTitle(String sourceTitle) {
        this.sourceTitle = sourceTitle;
    }

    public String getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(String totalPages) {
        this.totalPages = totalPages;
    }

    public String getConvertPath() {
        return convertPath;
    }

    public void setConvertPath(String convertPath) {
        this.convertPath = convertPath;
    }
}

package com.gogowise.action.course.vclass;

import com.gogowise.common.utils.UploadUtils;

/**
 * Created by benson on 14-1-16.
 */
public class MaterialVo {
    private Integer id;
    private int type;
    private String description;
    private String fullPath;
    private String sourceTitle;
    private Integer totalPages;
    private String convertPath;
    private String fileExt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFullPath() {
        return fullPath;
    }

    public void setFullPath(String fullPath) {
        this.fullPath = fullPath;
    }

    public String getSourceTitle() {
        return sourceTitle;
    }

    public void setSourceTitle(String sourceTitle) {
        this.sourceTitle = sourceTitle;
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

    public String getFileExt() {
        if (this.fullPath == null) return null;
        return UploadUtils.getExtension(this.fullPath).replace(".", "");
    }

    public void setFileExt(String fileExt) {
        this.fileExt = fileExt;
    }
}

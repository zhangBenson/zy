package com.gogowise.common.utils;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.Date;


public class UploadUtils {
    public static String REAL_PATH_FOR_BASE_DIR;
    private static final Logger logger = LogManager.getLogger(Utils.class.getName());

    public static void mkDir(File file) {
        if (file.exists()) {
            return;
        }
        if (!file.mkdir()) {
            logger.error("mkdir failed" + file.getAbsolutePath());
        }
        if (!file.setReadable(true) || file.setWritable(true)) {
            logger.error("pptConvert : set read write failed");
        }
    }

    public static String getRealPathForBaseDir() {

        if (REAL_PATH_FOR_BASE_DIR == null) {
            return REAL_PATH_FOR_BASE_DIR = ServletActionContext.getServletContext().getRealPath("/");
        } else {
            return REAL_PATH_FOR_BASE_DIR;
        }
    }

    public static void copy(File src, File dst) {
        if (!dst.getParentFile().exists()) {
            mkDir(dst.getParentFile());
        }
        copyByChannel(src, dst);

    }

    public static String copyTmpFileByUser(String fileName, Integer userId) {
        if (StringUtils.isNotBlank(fileName) && !StringUtils.contains(fileName, Constants.UPLOAD_PATH)) {
            String toDir = Constants.UPLOAD_PATH + userId + "/";
            replaceFileFromTemp(toDir, fileName);
            return toDir + fileName;
        } else {
            return fileName;
        }
    }

    public static void replaceFileFromTemp(String toDir, String fileName) {
        String srcPath = convertToRealPatch(Constants.UPLOAD_FILE_PATH_TMP + fileName);
        String desPath = convertToRealPatch(toDir + fileName);
        replaceFile(srcPath, desPath);
    }

    public static String convertToRealPatch(String path) {
        return ServletActionContext.getServletContext().getRealPath(path);
    }

    private static void copyByChannel(File f1, File f2) {
        try {
            int length;
            FileInputStream in = new FileInputStream(f1);
            FileOutputStream out = new FileOutputStream(f2);
            FileChannel inC = in.getChannel();
            FileChannel outC = out.getChannel();
            while (true) {
                if (inC.position() == inC.size()) {
                    inC.close();
                    outC.close();
                    return;
                }
                if ((inC.size() - inC.position()) < Constants.BUFFER_SIZE)
                    length = (int) (inC.size() - inC.position());
                else
                    length = Constants.BUFFER_SIZE;
                inC.transferTo(inC.position(), length, outC);
                inC.position(inC.position() + length);
            }

        } catch (IOException e) {
            logger.error("copy file failed ", e);
        }
    }

    public static void replaceFile(String srcPath, String dstPath) {

        File src = new File(srcPath);
        File dst = new File(dstPath);

        if (!dst.getParentFile().exists()) {
            mkDir(dst.getParentFile());
        }
        copyByChannel(src, dst);
    }

    public static String getExtension(String fileName) {
        int pos = fileName.lastIndexOf(".");
        if (pos >= 0) {
            return fileName.substring(pos);
        } else {
            return "";
        }
    }

    public static String getFileName(String fileName) {
        int pos = fileName.lastIndexOf(".");
        if (pos >= 0) {
            return fileName.substring(0, pos);
        } else {
            return fileName;
        }
    }

    public static String getNameByTime() {
        SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return sDateFormat.format(new Date());
    }

    public static String getContractFilePath(Integer userId) {
        return getRealPathForBaseDir() + Constants.UPLOAD_PATH + userId + "/" + UploadUtils.getNameByTime() + "contract.pdf";
    }
}

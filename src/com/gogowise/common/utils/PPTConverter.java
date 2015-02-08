package com.gogowise.common.utils;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.model.TextRun;
import org.apache.poi.hslf.usermodel.RichTextRun;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.xslf.usermodel.*;
import org.artofsolving.jodconverter.OfficeDocumentConverter;
import org.artofsolving.jodconverter.office.DefaultOfficeManagerConfiguration;
import org.artofsolving.jodconverter.office.OfficeManager;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.List;


public class PPTConverter {
    private static final Logger logger = LogManager.getLogger(PPTConverter.class);

    //    private static final String OFFICE_HOME = "C:\\Program Files (x86)\\OpenOffice 4\\";
    private static final String OFFICE_HOME = "/usr/lib/libreoffice/program/";

    public static final int DEFAULT_WIDTH = 800;
    public static final int DEFAULT_HEIGHT = 600;
    private String desPath;
    private String srcPath;
    private int index;
    private Dimension pgsize;
    private BufferedImage img;
    private String desVPath;


    public void convert(String pptName, Integer userId) throws Exception {

        String BASE_PATCH = UploadUtils.getRealPathForBaseDir();
//        String BASE_PATCH = "D:\\dev\\WorkSpace\\zy\\WebRoot.war\\";
        String fileName = UploadUtils.getFileName(pptName);
        desVPath = Constants.UPLOAD_PATH + userId + "/" + fileName;
        desPath = BASE_PATCH + desVPath;
        srcPath = BASE_PATCH + Constants.UPLOAD_PATH + userId + "/" + pptName;
        UploadUtils.mkDir(new File(desPath));
        String fileExtensionName = UploadUtils.getExtension(pptName);
        if (".pptx".equalsIgnoreCase(fileExtensionName)) {
            convertPPTX();
        } else if (".ppt".equalsIgnoreCase(fileExtensionName)) {
            convertPPT();
        } else if (".doc".equalsIgnoreCase(fileExtensionName) || ".docx".equalsIgnoreCase(fileExtensionName)
                || ".xls".equalsIgnoreCase(fileExtensionName) || ".xlsx".equalsIgnoreCase(fileExtensionName)) {
            convertWord();
        } else {
            convertPdf();
        }
    }


    private void convertPPT() throws IOException {

        FileInputStream is = new FileInputStream(srcPath);
        SlideShow ppt = new SlideShow(is);
        is.close();
        pgsize = ppt.getPageSize();

        Slide[] slide = ppt.getSlides();
        for (index = 0; index < slide.length; index++) {
            drawPPTSlide(slide[index]);
        }
    }

    private void drawPPTSlide(Slide slide) throws IOException {
        setFont(slide);
        Graphics2D graphics = createGraphics2D();
        slide.draw(graphics);
        drawPng();
    }

    private void setFont(Slide slide) {
        TextRun[] truns = slide.getTextRuns();
        for (TextRun trun : truns) {
            RichTextRun[] rtruns = trun.getRichTextRuns();
            for (RichTextRun rtrun : rtruns) {
                if (!FontMap.isSupport(rtrun.getFontName())) {
                    logger.info("=unspportFornt=" + rtrun.getFontName());
                    rtrun.setFontIndex(1);
                    rtrun.setFontName("宋体");
                }
            }
        }
    }

    private void drawPng() throws IOException {
        saveImage(desPath + "/brif_" + index + ".png");

        if (index == 0) {
            drawSmall();
        }
        img = null;
    }

    private void saveImage(String pngPatch) throws IOException {
        Image smallImg = img.getScaledInstance(DEFAULT_WIDTH, DEFAULT_HEIGHT, Image.SCALE_SMOOTH);
        img = new BufferedImage(DEFAULT_WIDTH, DEFAULT_HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = img.createGraphics();
        g.drawImage(smallImg, 0, 0, null);
        g.dispose();

        OutputStream out = new FileOutputStream(pngPatch);
        ImageIO.write(img, "png", out);
        out.close();
    }

    private Graphics2D createGraphics2D() {
        img = new BufferedImage(pgsize.width, pgsize.height, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = img.createGraphics();
        graphics.setPaint(Color.white);
        graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));
        return graphics;
    }

    private void drawSmall() throws IOException {
        Image smallImg = img.getScaledInstance(240, 180, Image.SCALE_SMOOTH);
        img = new BufferedImage(240, 180, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = img.createGraphics();
        g.drawImage(smallImg, 0, 0, null);
        g.dispose();
        saveImage(desPath + "/brif_small.png");
    }


    private void convertPPTX() throws IOException {
        FileInputStream is = new FileInputStream(srcPath);
        XMLSlideShow ppt = new XMLSlideShow(is);
        is.close();

        pgsize = ppt.getPageSize();

        XSLFSlide[] slide = ppt.getSlides();
        for (index = 0; index < slide.length; index++) {
            drawPPTX(slide[index]);
        }
    }

    private void drawPPTX(XSLFSlide slide) throws IOException {


        Graphics2D graphics = createGraphics2D();
        setFont(slide);


        slide.draw(graphics);
        drawPng();
    }

    private void setFont(XSLFSlide slide) {
        for (XSLFShape shape : slide.getShapes()) {
            if (shape instanceof XSLFTextShape) {
                for (XSLFTextParagraph paragraph : ((XSLFTextShape) shape)) {
                    List<XSLFTextRun> truns = paragraph.getTextRuns();
                    for (XSLFTextRun trun : truns) {
                        if (!FontMap.isSupport(trun.getFontFamily())) {
                            logger.info("=========unspportFornt==========" + trun.getFontFamily());
                            trun.setFontFamily("宋体");
                        }
                    }
                }
            }

        }
    }

    public void convertWord() throws Exception {
        convertWordToPdf();
        convertPdf();
    }

    private synchronized void convertWordToPdf() {
        String desPdfPath = this.replaceToPdf(srcPath);
        OfficeManager officeManager = null;
        try {
            officeManager = new DefaultOfficeManagerConfiguration().setOfficeHome(OFFICE_HOME).buildOfficeManager();
            officeManager.start();

            OfficeDocumentConverter converter = new OfficeDocumentConverter(officeManager);
            converter.convert(new File(srcPath), new File(desPdfPath));
        } catch (Throwable t) {
        } finally {
            if (officeManager != null)
                officeManager.stop();
        }
        srcPath = desPdfPath;
    }


    public void convertPdf() throws Exception {

        PDDocument document = PDDocument.load(srcPath);
        List pages = document.getDocumentCatalog().getAllPages();
        for (index = 0; index < document.getNumberOfPages(); index++) {
            PDPage page = (PDPage) pages.get(index);
            img = page.convertToImage(BufferedImage.TYPE_INT_RGB, 72);
            drawPng();
        }
    }

    public int getIndex() {
        return index;
    }

    public String getDesVPath() {
        return desVPath;
    }


    private String replaceToPdf(String filePatch) {
        String[] splitArray = StringUtils.split(filePatch, ".");
        splitArray[splitArray.length - 1] = ".pdf";
        return StringUtils.join(splitArray, ",");
    }

//    public static void main(String[] args) {
//
//        OfficeManager officeManager = null;
//        try {
//            officeManager = new DefaultOfficeManagerConfiguration().setOfficeHome(OFFICE_HOME).buildOfficeManager();
//            officeManager.start();
//
//            OfficeDocumentConverter converter = new OfficeDocumentConverter(officeManager);
//            converter.convert(new File("D:\\dev\\WorkSpace\\zy\\src\\com\\gogowise\\DocxBig.docx"), new File("test.pdf"));
//            converter.convert(new File("D:\\dev\\WorkSpace\\zy\\src\\com\\gogowise\\1.xls"), new File("test3.pdf"));
//        } catch (Throwable t) {
//        }finally {
//            if (officeManager != null)
//                officeManager.stop();
//        }
//    }


}

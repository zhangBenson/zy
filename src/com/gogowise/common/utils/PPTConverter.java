package com.gogowise.common.utils;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.model.TextRun;
import org.apache.poi.hslf.usermodel.RichTextRun;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.xslf.usermodel.*;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;


public class PPTConverter {
    private static final Logger logger = LogManager.getLogger(PPTConverter.class);
    private static final List<String> fontNames = new ArrayList<>();

    static {
        GraphicsEnvironment e = GraphicsEnvironment.getLocalGraphicsEnvironment();
        String[] fontName = e.getAvailableFontFamilyNames();
        fontNames.addAll(fontNames);
        for (String aFontName : fontName) {
            logger.info(aFontName + "==========spportedFont====");
        }
    }
    public static final int DEAFULT_WIDTH = 600;
    public static final int DEFAULT_HEIGHT = 800;
    private String desPath;
    private String srcPath;
    private int index;
    private Dimension pgsize;
    private BufferedImage img;
    private String desVPath;


    public void convert(String pptName, Integer userId) throws Exception {

//        String BASE_PATCH = UploadUtils.getRealPathForBaseDir();
        String BASE_PATCH = "D:\\dev\\WorkSpace\\zy\\WebRoot.war\\";
        String fileName = UploadUtils.getFileName(pptName);
        desVPath = Constants.UPLOAD_PATH + userId + "/" + fileName;
        desPath = BASE_PATCH + desVPath;
        srcPath = BASE_PATCH + Constants.UPLOAD_PATH + userId + "/" + pptName;
        UploadUtils.mkDir(new File(desPath));

        if (".pptx".equalsIgnoreCase(UploadUtils.getExtension(pptName))) {
            convertPPTX();
        } else if (".ppt".equalsIgnoreCase(UploadUtils.getExtension(pptName))) {
            convertPPT();
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
                if (!fontNames.contains(rtrun.getFontName())) {
                    logger.info("=========unspportFornt==========" + rtrun.getFontName());
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
        Image smallImg = img.getScaledInstance(DEAFULT_WIDTH, DEFAULT_HEIGHT, Image.SCALE_SMOOTH);
        img = new BufferedImage(DEAFULT_WIDTH, DEFAULT_HEIGHT, BufferedImage.TYPE_INT_RGB);
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
                        if (!fontNames.contains(trun.getFontFamily())) {
                            logger.info("=========unspportFornt==========" + trun.getFontFamily());
                            trun.setFontFamily("宋体");
                        }
                    }
                }
            }

        }
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

    public static void main(String[] args) throws Exception {

        new PPTConverter().convert("5.pptx", 11);
        new PPTConverter().convert("3.ppt", 11);
//        new PPTConvertor().convert("4.pdf", 11);
    }

}

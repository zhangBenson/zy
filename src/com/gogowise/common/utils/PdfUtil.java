package com.gogowise.common.utils;

import com.gogowise.rep.user.enity.BaseUser;
import com.gogowise.rep.course.enity.Course;
import com.gogowise.rep.course.enity.CourseClass;
import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.List;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

import java.awt.*;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-31
 * Time: 下午2:46
 * To change this template use File | Settings | File Templates.
 */
public class PdfUtil {
    /**
     * @param filePath     文件路径
     * @param schoolName   学校名字
     * @param contractCode 协议编码
     * @param resName      负责人名字
     * @param resEmail     负责人email
     * @param bankName     开户银行名字
     * @param bankAcount   开户帐号
     * @param accountName   开户人名字
     * @throws Exception
     */
    public static void createContractForSchool(String filePath, String schoolName, String contractCode,
                                               String resName, String resEmail, String bankName, String bankAcount, String accountName) throws Exception {

        Document doc = new Document(PageSize.A4, 50, 50, 50, 50);
        File file = new File(filePath);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdir();
            if (!file.exists()) {
                file.createNewFile();
            }
        }

        PdfWriter.getInstance(doc, new FileOutputStream(file));
        BaseFont fontChinese = null;
        fontChinese = BaseFont.createFont("C:\\WINDOWS\\Fonts\\SIMSUN.TTC,1", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);// 设置中文字体
        Font chinese = new Font(fontChinese, 10, Font.NORMAL);

        //设置页眉
        HeaderFooter header = new HeaderFooter(new Phrase(schoolName + "组织机构免费使用嘉兴移动公开课教学平台协议 \t\t协议编号：" + contractCode,
                chinese), false);
        header.setBorder(Rectangle.BOTTOM);
        header.setAlignment(1);
        header.setBorderColor(Color.red);
        doc.setHeader(header);

        //设置页脚
        HeaderFooter footer = new HeaderFooter(new Phrase("-", chinese),
                new Phrase("-", chinese));
        footer.setAlignment(Element.ALIGN_CENTER);
        footer.setBorderColor(Color.red);
        footer.setBorder(Rectangle.BOTTOM);
        doc.setFooter(footer);
        /*
           * 页眉页脚的设置一定要在open前设置好
           */
        doc.open();

        Paragraph paragraph = new Paragraph(schoolName + "组织机构（以下简称甲方）同长沙知金电子科技有限公司（以下简称乙方）就甲方免费使用乙方所属的嘉兴移动公开课网络教学平台达成以下协议：\n", chinese);
        paragraph.setFirstLineIndent(20);
        paragraph.setSpacingAfter(10);
        paragraph.setAlignment(3);//左对齐
        doc.add(paragraph);
        /*
           * true:代表要排序,10代表序号与文字之间的间距 false:代表不排序，则文字前的符号为"-"
           */
        List itextList = new List(true, 15);
        itextList.setAutoindent(true);
        /*
           * 也可以改变列表的符号[可选] $$$$$$$$$$$ 要改变列表符号时，上面的List构造方法第一参数值必须为false
           * $$$$$$$$$$$ 可以使用字符串，Chunk,Image等作列表符号,如下
           */
        // itextList.setListSymbol("*");
        itextList.add(new ListItem("甲方及所属所有教师使用嘉兴移动公开课进行网络教学，如实时网络公开课等，嘉兴移动公开课将不收取任何费用；\n", chinese));
        itextList.add(new ListItem("甲方及所属所有教师在嘉兴移动公开课进行网络教学所产生的收益，包括网络实时教学、教学录像、教学课件等（以下简称为甲方版权收益），乙方将支付甲方此收益的20%作为甲方的版权收益；\n", chinese));
        itextList.add(new ListItem("甲方所属教师（此教师）在嘉兴移动公开课进行网上教学所产生的收益，包括此老师的网络实时教学、教学录像、教学课件等（以下简称为甲方此教师版权收益），乙方将支付此教师此收益的30%作为此教师的版权收益；\n", chinese));
        itextList.add(new ListItem("甲方指定甲方教师: 姓名：" + resName + "，嘉兴移动公开课注册email：" + resEmail + ",为甲方在嘉兴移动公开课上甲方注册组织唯一指定负责人，全权负责课程的开设、教师身份的确认、课堂内容的监管等实体学校相同的工作，并承担相关的责任，保证教学内容健康、合法。乙方将支付此负责人在负责期间内甲方新教学课件所产生的版权收益（以下简称负责人负责期内甲方版权收益）的8%作为此负责人的劳动报酬；\n", chinese));
        itextList.add(new ListItem("甲方有权随时变更嘉兴移动公开课负责人，通过嘉兴移动公开课 首页->组织机构->变更负责人 进入负责人变更流程。一旦变更完成，原负责人将终生拥有其负责期内甲方版权收益的8%，同时乙方开始支付新负责人其负责期内所开办新的课程产生版权收益的8%作为其劳动报酬。我们收到贵校负责人变更协议后生效，生效日期以邮戳为准。\n", chinese));
        itextList.add(new ListItem("甲方有责任为乙方工作人员，如摄像师等提供相应的便利，保证乙方正常工作的开展；\n", chinese));
        itextList.add(new ListItem("乙方将在不影响甲方正常教学的前提下，免费为甲方提供实时教学摄像、录像剪辑、教学视频点播、教学课件上传和下载功能、学校形象宣传等服务；\n", chinese));
        itextList.add(new ListItem("乙方工作人员在为甲方提供服务之前，必须获得相关老师以及学校负责人的批准，批准流程在嘉兴移动公开课中实现；\n", chinese));
        itextList.add(new ListItem("乙方将按季度定期结算甲方的收益，乙方将相关收益转账至甲方对公账户，同时附上收益清单，如果出现异议，甲方有清查甲方学校收益的权利；\n", chinese));
        itextList.add(new ListItem("乙方将按季度定期结算甲方负责人以及原负责人（如果发生负责人变更）的收益，乙方将相关收益转账至甲方负责人及原负责人的私人账户，同时附上收益清单，如果出现异议，甲方负责人及原负责人有清查个人收益的权利，甲方负责人须在嘉兴移动公开课上提交真实的个人账户信息；\n", chinese));
        itextList.add(new ListItem("甲方对公账户信息：开户名称：" + accountName + ", 开户银行：" + bankName + "，开户账号：" + bankAcount + "\n", chinese));
        itextList.add(new ListItem("为了避免恶性竞争影响甲方正常的教学次序，严禁甲方接受除乙方以外其他非官方网站提供的同乙方相类似的服务，否则，乙方将有权终止支付甲方及甲方所属老师的版权收益；\n", chinese));
        itextList.add(new ListItem("甲乙双方都应遵守相关法律，如果合作过程中出现违法的情况，双方将各自独立承担相关的法律责任，不存在联带责任。\n", chinese));
        itextList.add(new ListItem("此协议一式四份，甲方一份、甲方嘉兴移动公开课负责人一份，乙方两份，乙方收到两份甲方签字、盖章协议原件以及一份加盖甲方公章的甲方法人执照复印件后，经乙方审核确认真实后协议生效，生效日期以邮件收到日邮戳为准。\n", chinese));
        itextList.add(new ListItem("未尽事宜，甲乙双方协商解决。\n", chinese));
        itextList.setIndentationLeft(20);
        itextList.setIndentationRight(20);
        doc.add(itextList);

        Paragraph p = new Paragraph("\n\n               甲方：                              乙方：\n" +
                "               名称：                              名称：长沙知金电子科技有限公司\n" +
                "               负责人签字：                        法人代表：曾锃\n" +
                "               签署时间：                          签署时间：（协议生成时间）\n" +
                "               公章：	                              公章：此为系统自动生成，不需要盖章\n", chinese);
        doc.add(p);
        doc.close();
    }

    public static void createContractForChangeRes(String filePath, String schoolName, String contractCode, String applicant, String applicantEmail,
                                                  String applicantTel, String oldApplicant, String oldEmail, String oldTelphone) throws Exception {
        Document doc = new Document(PageSize.A4, 50, 50, 50, 50);
        PdfWriter.getInstance(doc, new FileOutputStream(filePath));
        BaseFont fontChinese = null;
        fontChinese = BaseFont.createFont("C:\\WINDOWS\\Fonts\\SIMSUN.TTC,1", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);// 设置中文字体
        Font chinese = new Font(fontChinese, 10, Font.NORMAL);

        //设置页眉
        HeaderFooter header = new HeaderFooter(new Phrase(schoolName + "组织机构变更" + schoolName + "组织机构负责人协议\t\t协议编号：" + contractCode,
                chinese), false);
        header.setBorder(Rectangle.BOTTOM);
        header.setAlignment(1);
        header.setBorderColor(Color.red);
        doc.setHeader(header);

        //设置页脚
        HeaderFooter footer = new HeaderFooter(new Phrase("-", chinese),
                new Phrase("-", chinese));
        footer.setAlignment(Element.ALIGN_CENTER);
        footer.setBorderColor(Color.red);
        footer.setBorder(Rectangle.BOTTOM);
        doc.setFooter(footer);
        /*
           * 页眉页脚的设置一定要在open前设置好
           */
        doc.open();

        Paragraph paragraph = new Paragraph("因为工作的需要，" + applicant + "申请变更" + schoolName + "学校变在嘉兴移动公开课" + schoolName + "学校注册组织负责人。\n", chinese);
        paragraph.setFirstLineIndent(20);
        paragraph.setSpacingAfter(10);
        paragraph.setAlignment(3);//左对齐
        doc.add(paragraph);
        paragraph = new Paragraph("原负责人信息：姓名：" + oldApplicant + "，注册email:" + oldEmail + "，联系电话：" + oldTelphone + "。将停止负责嘉兴移动公开课" + schoolName + "注册组织的所有工作。\n", chinese);
        paragraph.setFirstLineIndent(20);
        paragraph.setSpacingAfter(10);
        paragraph.setAlignment(3);//左对齐
        doc.add(paragraph);
        paragraph = new Paragraph("申请人信息：姓名：" + applicant + ", 注册email: " + applicantEmail + "，联系电话：" + applicantTel + "，将成为嘉兴移动公开课" + schoolName + "学校注册组织新负责人，至变更生效日期起，将享有负责人的所有责任和权益。\n", chinese);
        paragraph.setFirstLineIndent(20);
        paragraph.setSpacingAfter(10);
        paragraph.setAlignment(3);//左对齐
        doc.add(paragraph);
        paragraph = new Paragraph("此协议一式四份，申请人一份，原负责人一份，学校一份，嘉兴移动公开课一份。申请人签字，原负责人签字，学校签字、盖章后生效。嘉兴移动公开课审核确认真实以后，协议生效。正式生效日期为嘉兴移动公开课收到协议当日算起，以邮戳日期为准。\n", chinese);
        paragraph.setFirstLineIndent(20);
        paragraph.setSpacingAfter(10);
        paragraph.setAlignment(3);//左对齐
        doc.add(paragraph);
        Paragraph p = new Paragraph("\n\n               甲方：                              乙方：\n" +
                "               名称：                              名称：长沙知金电子科技有限公司\n" +
                "               负责人签字：                        法人代表：曾锃\n" +
                "               签署时间：                          签署时间：（协议生成时间）\n" +
                "               公章：                              公章：此为系统自动生成，不需要盖章\n\n\n" +
                "               " + schoolName + "组织机构\n" +
                "               负责人签字：\n" +
                "               公章：\n" +
                "               日期：", chinese);
        doc.add(p);
        doc.close();
    }

    public static void createCourseContract(String filePath, Course course, BaseUser user) throws Exception {
        Document doc = new Document(PageSize.A4, 50, 50, 50, 50);
        File file = new File(filePath);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdir();
            if (!file.exists()) {
                file.createNewFile();
            }
        }

        PdfWriter.getInstance(doc, new FileOutputStream(file));
        BaseFont fontChinese = null;
        fontChinese = BaseFont.createFont("C:\\WINDOWS\\Fonts\\SIMSUN.TTC,1", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);// 设置中文字体
        Font chinese = new Font(fontChinese, 10, Font.NORMAL);

        //设置页眉
        HeaderFooter header = new HeaderFooter(new Phrase(course.getName() + "课程注册协议书 \t\t协议编号：" + System.currentTimeMillis(),
                chinese), false);
        header.setBorder(Rectangle.BOTTOM);
        header.setAlignment(1);
        header.setBorderColor(Color.red);
        doc.setHeader(header);

        //设置页脚
        HeaderFooter footer = new HeaderFooter(new Phrase("-", chinese),
                new Phrase("-", chinese));
        footer.setAlignment(Element.ALIGN_CENTER);
        footer.setBorderColor(Color.red);
        footer.setBorder(Rectangle.BOTTOM);

        doc.setFooter(footer);
        /*
           * 页眉页脚的设置一定要在open前设置好
           */
        doc.open();
        doc.add(new Phrase("\n\n",chinese));

        Table aTable = new Table(4);
        int width[] = {25, 50, 25, 50};
        aTable.setWidths(width);
        aTable.setWidth(80); // 占页面宽度 80%

        aTable.setAutoFillEmptyCells(true); //自动填满
        aTable.setPadding(1);
        aTable.setSpacing(1);
        aTable.setBorder(0);
        Cell cell = new Cell(new Phrase("甲方：", chinese));
        cell.setBorder(0);
        aTable.addCell(cell);
        Cell cell2 = new Cell(new Phrase(user.getNickName(), chinese));
        cell2.setBorder(0);
        aTable.addCell(cell2);
        Cell cell3 = new Cell(new Phrase("乙方：", chinese));
        cell3.setBorder(0);
        aTable.addCell(cell3);
        Cell cell4 = new Cell(new Phrase(course.getOrganization()!=null?course.getOrganization().getResponsiblePerson().getNickName():course.getTeacher().getNickName(), chinese));
        cell4.setBorder(0);
        aTable.addCell(cell4);
        Cell cell5 = new Cell(new Phrase("联系电话：", chinese));
        cell5.setBorder(0);
        aTable.addCell(cell5);
        Cell cell6 = new Cell(new Phrase(Utils.getEmptyString(user.getTelphone()), chinese));
        cell6.setBorder(0);
        aTable.addCell(cell6);
        Cell cell7 = new Cell(new Phrase("联系电话：", chinese));
        cell7.setBorder(0);
        aTable.addCell(cell7);
        Cell cell8 = new Cell(new Phrase(Utils.getEmptyString(course.getOrganization() != null ? course.getOrganization().getResponsiblePerson().getTelphone() : course.getTeacher().getTelphone()), chinese));
        cell8.setBorder(0);
        aTable.addCell(cell8);
        Cell cell9 = new Cell(new Phrase("Email：", chinese));
        cell9.setBorder(0);
        aTable.addCell(cell9);
        Cell cell10 = new Cell(new Phrase(user.getEmail(), chinese));
        cell10.setBorder(0);
        aTable.addCell(cell10);
        Cell cell11 = new Cell(new Phrase("Email：", chinese));
        cell11.setBorder(0);
        aTable.addCell(cell11);
        Cell cell12 = new Cell(new Phrase(course.getOrganization()!=null?course.getOrganization().getResponsiblePerson().getEmail():course.getTeacher().getEmail(), chinese));
        cell12.setBorder(0);
        aTable.addCell(cell12);

        doc.add(aTable);
        Paragraph paragraph = new Paragraph("\n\n本着自愿的原则，甲方和乙方双方就甲方参加由乙方负责的" + course.getName() + "学习班的事宜，达成以下协议：", chinese);
        paragraph.setFirstLineIndent(20);
        paragraph.setSpacingAfter(10);
        paragraph.setAlignment(3);//左对齐
        doc.add(paragraph);
        List itextList = new List(true, 15);
        itextList.setAutoindent(true);
        itextList.add(new ListItem("学习班主要内容：\n" +
                "本外语学习班名称为：" + course.getName() + "\n" +
                "主要内容为：" + Utils.getEmptyString(course.getDescription()) + "\n", chinese));

        itextList.add(new ListItem("教学时间安排：\n" +
                "本" + course.getName() + "学习班总学时为：" + course.getTotalHours() + "小时，分："+course.getNeedWeeks()+"周完成。", chinese));
        String msg = "教学课程安排\n";
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for (CourseClass clazz : course.getClasses()) {
            Calendar clazzStartTime = Calendar.getInstance();
            clazzStartTime.setTime(clazz.getDate().getTime());
            msg += clazz.getName() + "：时间：" + dateFormat.format(Utils.changeBaseOnTimeZone4Action(clazzStartTime).getTime())+ "，\n" +
                    "内容安排：" + Utils.getEmptyString(clazz.getNickName()) + "\n";
        }
        itextList.add(new ListItem(msg, chinese));
        itextList.add(new ListItem("学习班费用及支付方式：\n" +
                "学习班总费用为" + course.getCharges() + (course.getConsumptionType() ? "知币" : "知券") + "，通过嘉兴移动公开课支付。", chinese));
        itextList.add(new ListItem("学习形式\n" +
                "网络教学，通过嘉兴移动公开课网络教学，完成教学；", chinese));
        itextList.add(new ListItem("甲方的责任和义务\n" +
                "准时上课，如果出现迟到、旷课的情况，所缺课程内容需要同老师协商安排补课，所产生费用需进一步协商决定。\n" +
                "保持课堂安静，禁止喧哗。\n", chinese));
        itextList.add(new ListItem("乙方的责任和义务\n" +
                "按照课程安排，高质量的完成教学任务；\n" +
                "准时上课、不许出现迟到、旷课的现象，如果迟到三次及以上，或出现一次旷课，将全额退还学习班费用给乙方。\n" +
                "\n" +
                "如果有未尽事宜，可以协商解决。如果出现无法调和的问题，将在甲方所在的裁仲机构进行裁仲，嘉兴移动公开课网络可以提供上课记录等相关资料。\n", chinese));

        doc.add(itextList);
        paragraph = new Paragraph("\n  \n    时间：" + new SimpleDateFormat("yyyy-MM-dd").format(new Date()) + "\n", chinese);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        doc.add(paragraph);
        doc.close();
    }
}

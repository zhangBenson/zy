package com.gogowise.common.schedule;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

public class EmailJob implements  Runnable {
    // Email sender
    private static final String SenderEmailAddr = "service@gogowise.com";

    // Email sender's name
    private static final String SMTPUserName = "service@gogowise.com";

    // Email password.
    private static final String SMTPPassword = "gogowise@123";

    // SMTP Server
    private static final String SMTPServerName = "mail.gogowise.com";


    //  EMAIL Related attribute.
    private static Properties props;
    static {
        props = new Properties();
        props.put("mail.smtp.host", SMTPServerName);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "465");
    }
    private  String emailAddr;
    private  String mailTitle;
    private  String mailContent;
    private  String[] fileNames;
    private  String[] filePaths;


    public void run() {
        try {
            Session session = Session.getDefaultInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(SMTPUserName, SMTPPassword);
                }
            });
//            session.setDebug(true);
            // Define message
            MimeMessage message =
                    new MimeMessage(session);
            message.setFrom(
                    new InternetAddress(SenderEmailAddr,"知元客服--GoGoWise Service"));
//        message.setReplyTo(new InternetAddress[]{new InternetAddress("reply email")});
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(emailAddr));

            message.setSubject(mailTitle, "utf-8");

            MimeBodyPart messageBodyPart =new MimeBodyPart();

            messageBodyPart.setContent(mailContent, "text/html;charset=utf-8");
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);

            if (fileNames != null && fileNames.length > 0) {
                for (int i = 0; i < fileNames.length; i++) {
                    // Part two is attachment
                    messageBodyPart = new MimeBodyPart();
                    DataSource source =
                            new FileDataSource(filePaths[i]);//attachment
                    messageBodyPart.setDataHandler(
                            new DataHandler(source));
                    messageBodyPart.setFileName(fileNames[i]);//attachment name
                    multipart.addBodyPart(messageBodyPart);
                }
            }
            // Put parts in message
            message.setContent(multipart);

            // Send the message
            Transport.send(message);//Send email
        } catch (Exception e) {
//            logger.error("mail address:" + emailAddr + " title:" + mailTitle + "fail in: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public String getEmailAddr() {
        return emailAddr;
    }

    public void setEmailAddr(String emailAddr) {
        this.emailAddr = emailAddr;
    }

    public String getMailTitle() {
        return mailTitle;
    }

    public void setMailTitle(String mailTitle) {
        this.mailTitle = mailTitle;
    }

    public String getMailContent() {
        return mailContent;
    }

    public void setMailContent(String mailContent) {
        this.mailContent = mailContent;
    }

    public String[] getFileNames() {
        return fileNames;
    }

    public void setFileNames(String[] fileNames) {
        this.fileNames = fileNames;
    }

    public String[] getFilePaths() {
        return filePaths;
    }

    public void setFilePaths(String[] filePaths) {
        this.filePaths = filePaths;
    }
}
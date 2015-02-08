//package com.gogowise.selenium;
//
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//import org.openqa.selenium.*;
//import org.openqa.selenium.chrome.ChromeDriver;
//import org.openqa.selenium.support.ui.Select;
//
//import java.util.concurrent.TimeUnit;
//
//import static org.junit.Assert.assertTrue;
//import static org.junit.Assert.fail;
//
//public class TestCreateCourse {
//    private WebDriver driver;
//    private String baseUrl;
//    private boolean acceptNextAlert = true;
//    private StringBuffer verificationErrors = new StringBuffer();
//
//    //    C:\Program Files (x86)\Google\Chrome\Application
//    @Before
//    public void setUp() throws Exception {
////        driver = new FirefoxDriver();
//        driver = new ChromeDriver();
//        baseUrl = "http://beta.gogowise.com/";
//        driver.manage().timeouts().implicitlyWait(1, TimeUnit.SECONDS);
//    }
//
//    @Test
//    public void testCreateCourse() throws Exception {
//        driver.get(baseUrl);
//        driver.findElement(By.id("btnLogin")).click();
//        driver.findElement(By.id("inputEmail3")).sendKeys("mindstretcher@gogowise.com");
//
//        driver.findElement(By.id("inputPassword3")).sendKeys("mindstretcher");
//        driver.findElement(By.id("log_btn")).click();
//
//        Thread.sleep(1000L);
//        assertTrue(isElementPresent(By.linkText("Mind Stretcher")));
//
//        driver.get(baseUrl + "myfirstPage.html");
//
//        Thread.sleep(10000L);
//        driver.findElement(By.linkText("Create a course now!")).click();
//        driver.findElement(By.id("step2_course_name")).clear();
//        driver.findElement(By.id("step2_course_name")).sendKeys("forTest");
//        driver.findElement(By.cssSelector("input.ui-widget-content.ui-autocomplete-input")).clear();
//        driver.findElement(By.cssSelector("input.ui-widget-content.ui-autocomplete-input")).sendKeys("test");
//        driver.findElement(By.id("step2_course_intro")).clear();
//        driver.findElement(By.id("step2_course_intro")).sendKeys("1321");
//        new Select(driver.findElement(By.id("step2_studentAge_type"))).selectByVisibleText("Age 3 ~ 4");
//        new Select(driver.findElement(By.id("step2_course_type"))).selectByVisibleText("Cartoons and Stories");
//
//
//        driver.findElement(By.id("courseStartDate")).sendKeys("09/17/2015");
//
//        driver.findElement(By.id("change_portrait")).click();
//        // ERROR: Caught exception [ERROR: Unsupported command [selectFrame | fancybox-frame1416498942488 | ]]
//        driver.findElement(By.cssSelector("input.submit_btn")).click();
//        // ERROR: Caught exception [ERROR: Unsupported command [selectWindow | null | ]]
//        driver.findElement(By.id("course_main_info_form_teacherIdsmindstretcher@gogowise.com")).click();
//        driver.findElement(By.id("studentEmail1")).clear();
//        driver.findElement(By.id("studentEmail1")).sendKeys("zlhades@hotmail.com");
//        driver.findElement(By.id("step2_store")).click();
//        driver.findElement(By.cssSelector("h3[alt=\"3\"]")).click();
//        driver.findElement(By.id("class_nickname_input")).clear();
//        driver.findElement(By.id("class_nickname_input")).sendKeys("1321");
//        driver.findElement(By.cssSelector("div.navImg.NavImgrr > a")).click();
//        driver.findElement(By.cssSelector("td.WdayOn")).click();
//        driver.findElement(By.cssSelector("td.WdayOn")).click();
//        driver.findElement(By.id("step3_self_store")).click();
//        driver.findElement(By.id("clauseCheckbox")).click();
//        driver.findElement(By.id("submit_btn_large")).click();
//        assertTrue(isElementPresent(By.linkText("forTest")));
//    }
//
//    @After
//    public void tearDown() throws Exception {
//        driver.quit();
//        String verificationErrorString = verificationErrors.toString();
//        if (!"".equals(verificationErrorString)) {
//            fail(verificationErrorString);
//        }
//    }
//
//    private boolean isElementPresent(By by) {
//        try {
//            driver.findElement(by);
//            return true;
//        } catch (NoSuchElementException e) {
//            return false;
//        }
//    }
//
//    private boolean isAlertPresent() {
//        try {
//            driver.switchTo().alert();
//            return true;
//        } catch (NoAlertPresentException e) {
//            return false;
//        }
//    }
//
//    private String closeAlertAndGetItsText() {
//        try {
//            Alert alert = driver.switchTo().alert();
//            String alertText = alert.getText();
//            if (acceptNextAlert) {
//                alert.accept();
//            } else {
//                alert.dismiss();
//            }
//            return alertText;
//        } finally {
//            acceptNextAlert = true;
//        }
//    }
//}

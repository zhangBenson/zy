package com.gogowise.action.paypal;

import com.gogowise.action.BasicAction;
import com.gogowise.common.utils.Constants;
import com.gogowise.rep.org.dao.OrganizationDao;
import com.gogowise.rep.org.enity.Organization;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Enumeration;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-02-17 19:22
 * Email: jhji@ir.hit.edu.cn
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class PayPalAction extends BasicAction
{
    private String payStatus;

    private String itemName;
    private String itemNum;
    private String amount;
    private String quantity;
    private Integer noShipping;
    private String returnURL;
    private String cancelURL;
    private String currencyCode;

    private Organization org;
    private OrganizationDao organizationDao;

    private Integer userID;
    private Integer orgID;

    private String tx;
    private String st;
    private String amt;
    private String cc;
    private String item_number;

    @Action(value = "SetExpressCheckout", results={@Result(name=SUCCESS, type = Constants.RESULT_NAME_REDIRECT_ACTION, params={} )} )
    public String SetExpressCheckout()
    {

        return  SUCCESS;
    }

    @Action(value = "payFinish", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "schoolCenter"} ),
                                         @Result(name = "Cancel", type = Constants.RESULT_NAME_REDIRECT_ACTION, params = {"actionName", "orgBlog","org.id", ""})})
    public String payFinish()
    {
        System.err.println("Begin");
        System.err.println(tx);
        System.err.println("End");
        return SUCCESS;
    }

    @Action(value = "ipn")
    public String ipn()
    {
        try
        {
            //从 PayPal 出读取 POST 信息同时添加变量„cmd‟来验证ipn信息是否是正确的ipn
            HttpServletRequest request = ServletActionContext.getRequest();
            Enumeration en = request.getParameterNames();
            String str = "cmd=_notify-validate";
            while(en.hasMoreElements())
            {
                String paramName = (String)en.nextElement();
                String paramValue = request.getParameter(paramName);
                str = str + "&" + paramName + "=" + URLEncoder.encode(paramValue, "iso-8859-1");
            }

            //建议在此将接受到的信息 str 记录到日志文件中以确认是否收到 IPN 信息
            //将信息 POST 回给 PayPal 进行验证
            //设置 HTTP 的头信息
            //在 Sandbox 情况下，设置：
            URL u= new URL("http://www.sandbox.paypal.com/cgi-bin/webscr");
            //URL u = new URL("http://www.paypal.com/cgi-bin/webscr");

            URLConnection uc = u.openConnection();
            uc.setDoOutput(true);
            uc.setRequestProperty("Content-Type","application/x-www-form-urlencoded");

            PrintWriter pw = new PrintWriter(uc.getOutputStream());
            pw.println(str);
            pw.close();

            //接受 PayPal 对 IPN 回发的回复信息
            BufferedReader in= new BufferedReader(new InputStreamReader(uc.getInputStream()));
            String res = in.readLine();
            in.close();

            //将 POST 信息分配给本地变量，可以根据您的需要添加
            //该付款明细所有变量可参考：
            //https://www.paypal.com/IntegrationCenter/ic_ipn-pdt-variable-reference.html
            String itemName = request.getParameter("item_name");
            String itemNumber = request.getParameter("item_number");
            String paymentStatus = request.getParameter("payment_status");
            String paymentAmount = request.getParameter("mc_gross");
            String paymentCurrency = request.getParameter("mc_currency");
            String txnId = request.getParameter("txn_id");
            String receiverEmail = request.getParameter("receiver_email");
            String payerEmail = request.getParameter("payer_email");

            //获取 PayPal 对回发信息的回复信息，判断刚才的通知是否为 PayPal 发出的
            if( res.equals("VERIFIED") )
            {
                //检查付款状态
                //检查 txn_id 是否已经处理过
                //检查 receiver_email 是否是您的 PayPal 账户中的 EMAIL 地址
                //检查付款金额和货币单位是否正确
                //处理其他数据，包括写数据库
            }
            else if( res.equals("INVALID") )
            {
            //非法信息，可以将此记录到您的日志文件中以备调查
            }
            else
            {
                //处理其他错误
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemNum() {
        return itemNum;
    }

    public void setItemNum(String itemNum) {
        this.itemNum = itemNum;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public Integer getNoShipping() {
        return noShipping;
    }

    public void setNoShipping(Integer noShipping) {
        this.noShipping = noShipping;
    }

    public String getReturnURL() {
        return returnURL;
    }

    public void setReturnURL(String returnURL) {
        this.returnURL = returnURL;
    }

    public String getCancelURL() {
        return cancelURL;
    }

    public void setCancelURL(String cancelURL) {
        this.cancelURL = cancelURL;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public Organization getOrg() {
        return org;
    }

    public void setOrg(Organization org) {
        this.org = org;
    }

    public OrganizationDao getOrganizationDao() {
        return organizationDao;
    }

    public void setOrganizationDao(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }


    public String getTx() {
        return tx;
    }

    public void setTx(String tx) {
        this.tx = tx;
    }

    public String getSt() {
        return st;
    }

    public void setSt(String st) {
        this.st = st;
    }

    public String getAmt() {
        return amt;
    }

    public void setAmt(String amt) {
        this.amt = amt;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getItem_number() {
        return item_number;
    }

    public void setItem_number(String item_number) {
        this.item_number = item_number;
    }
}

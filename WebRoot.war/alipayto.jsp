<%
/* *
 *功能：担保交易接口接入页
 *版本：3.2
 *日期：2011-03-17
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 *************************注意*****************
 *如果您在接口集成过程中遇到问题，可以按照下面的途径来解决
 *1、商户服务中心（https://b.alipay.com/support/helperApply.htm?action=consultationApply），提交申请集成协助，我们会有专业的技术工程师主动联系您协助解决
 *2、商户帮助中心（http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9）
 *3、支付宝论坛（http://club.alipay.com/read-htm-tid-8681712.html）
 *如果不想使用扩展功能请把扩展功能参数赋空值。
 * 总金额计算方式是：总金额=price*quantity+logistics_fee+discount。
 * 建议把price看作为总金额，是物流运费、折扣、购物车中购买商品总额等计算后的最终订单的应付总额。
 * 建议物流参数只使用一组，根据买家在商户网站中下单时选择的物流类型（快递、平邮、EMS），程序自动识别logistics_type被赋予三个中的一个值
 * 各家快递公司都属于EXPRESS（快递）的范畴
 **********************************************
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.gogowise.alipay.services.AlipayService"%>
<%@ page import="com.gogowise.alipay.util.UtilDate"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>支付宝担保交易</title>
	</head>
	<%    
		////////////////////////////////////请求参数//////////////////////////////////////
		
		//必填参数//

		UtilDate date = new UtilDate();//调取支付宝工具类生成订单号
		//请与贵网站订单系统中的唯一订单号匹配
		String out_trade_no = date.getOrderNum();
		//订单名称，显示在支付宝收银台里的“商品名称”里，显示在支付宝的交易管理的“商品名称”的列表里。
//		String subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"),"utf-8");
        String subject = request.getParameter("subject");
		//订单描述、订单详细、订单备注，显示在支付宝收银台里的“商品描述”里
//		String body = new String(request.getParameter("alibody").getBytes("ISO-8859-1"),"utf-8");
        String body = request.getParameter("alibody");
		//订单总金额，显示在支付宝收银台里的“应付总额”里
		String price = new String(request.getParameter("total_fee").getBytes("ISO-8859-1"),"utf-8");
		
		//物流费用，即运费。
		String logistics_fee = "0.00";
		//物流类型，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
		String logistics_type = "EXPRESS";
		//物流支付方式，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）
		String logistics_payment = "SELLER_PAY";
		
		//商品数量，建议默认为1，不改变值，把一次交易看成是一次下订单而非购买一件商品。
		String quantity = "1";
		
		//扩展参数//
		
		//买家收货信息（推荐作为必填）
		//该功能作用在于买家已经在商户网站的下单流程中填过一次收货信息，而不需要买家在支付宝的付款流程中再次填写收货信息。
		//若要使用该功能，请至少保证receive_name、receive_address有值
		String receive_name	= "收货人姓名";			//收货人姓名，如：张三
		String receive_address = "收货人地址";		//收货人地址，如：XX省XXX市XXX区XXX路XXX小区XXX栋XXX单元XXX号
		String receive_zip = "123456";				//收货人邮编，如：123456
		String receive_phone = "0571-81234567";		//收货人电话号码，如：0571-81234567
		String receive_mobile = "13312341234";		//收货人手机号码，如：13312341234
		
		// 网站商品的展示地址，不允许加?id=123这类自定义参数
		String show_url = "http://www.xxx.com/myorder.jsp";
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("payment_type","1");
		sParaTemp.put("show_url", show_url);
		sParaTemp.put("out_trade_no", out_trade_no);
		sParaTemp.put("subject", subject);
		sParaTemp.put("body", body);
		sParaTemp.put("price", price);
		sParaTemp.put("logistics_fee", logistics_fee);
		sParaTemp.put("logistics_type", logistics_type);
		sParaTemp.put("logistics_payment", logistics_payment);
		sParaTemp.put("quantity", quantity);
		sParaTemp.put("receive_name", receive_name);
		sParaTemp.put("receive_address", receive_address);
		sParaTemp.put("receive_zip", receive_zip);
		sParaTemp.put("receive_phone", receive_phone);
		sParaTemp.put("receive_mobile", receive_mobile);
		
		//构造函数，生成请求URL
		String sHtmlText = AlipayService.create_partner_trade_by_buyer(sParaTemp);
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>

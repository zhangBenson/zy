/**
 * getQuestionResult生成图形结果
 * @param right (int)答对人数
 * @param wrong (int)答错人数
 * @param noresponse (int)没有应答
 */
function getQuestionResult(right,wrong,noresponse)
{
	var pieData = [
		{
			value: right,
			color:"#F38630"
		},
		{
			value : wrong,
			color : "#E0E4CC"
		},
		{
			value : noresponse,
			color : "#69D2E7"
		}
	
	];

	var myPie = new Chart(document.getElementById("canvas").getContext("2d")).Pie(pieData);
}


/**
 * ShowMessage 显示虚拟教室中聊天信息
 * @param name (string)发言者姓名
 * @param imgpath (string)发言者头像路径 
 * @param content (string)发言内容
 * @param bit (bool)呈现位置(ture为左边,false为右边)
 */
function ShowMessage(name,imgpath,content,bit)
{
	if(content == "")
		return;

	var inithight = $("#charList").height();
	var isleft;
	if(bit)
		isleft = "pull-left";
	else
		isleft = "pull-right";
	
	var chatMessage = "<div class='chatMessage'>"+
					"<div class='"+isleft+"' style='width:70px;'>"+
					"<img class='chatPortraitImg' src='"+imgpath+"'  />"+
					"<div class='chatPortraitTitle'>"+name+"</div>"+
					"</div>"+
					"<div style='width: 290px;' class='"+isleft+"'>"+
					"<div class='chatContent'>"+content+"</div>"+
					"</div>"+
					"</div><div class='clearfix'></div>"

	$("#charList").append(chatMessage);

	chatWrapper.refresh();

	if(inithight<200)
  		chatWrapper.scrollTo(0, $("#charList").height() - $("#chatWrapper").height(), 200, true);
  	else
  		chatWrapper.scrollTo(0, $("#charList").height() - inithight, 200, true);
}


/**
 * addOneStudent 一个学生进入虚拟教室
 * @param name (string) 学生姓名
 * @param imgpath (string) 学生头像路径 
 * @param id (string) 用户ID
 * @param ismsg (bool) 是否需要提示信息 true = 显示学生进入提示信息 false = 不显示学生进入信息
 */
function addOneStudent(name,imgpath,id,ismsg)
{

}

/**
 * deleteOneStudent 一个学生离开虚拟教室
 * @param id (string) 用户ID
 */
function deleteOneStudent(id)
{
	
}

/**
 * showQuestions 打开练习题库窗口
 */
function showQuestions()
{
	
}

/**
 * showFile 打开文件窗口
 */
function showFile()
{
	
}

/**
 * studentAskSpeak 学生举手请求发言
 * @param id (string) 用户ID
 */
function studentAskSpeak(id)
{
	tabstate(id,1,true);
	studioSortUp(id);
}


/**
 * cancelStudentSpeak 取消学生举手发言请求
 * @param id (string) 用户ID
 */
function cancelStudentSpeak(id)
{
	
}

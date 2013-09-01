function goBack() {
	window.history.go(-1);
}
function goUrl(url){
	window.location.href = url;
}
function formSubmit(actionUrl){
	var submitForm = window.document.forms[0];
	window.document.forms[0].action = actionUrl;
	window.document.forms[0].submit();
}
function disableTable(id) {
	var tableObj = document.getElementById(id);
	if (tableObj.style.display.toLowerCase() == 'block') {
		tableObj.style.display = 'none';
	} else {
		tableObj.style.display = 'block';
	}
}
function fullOpen(url){
    var vwidth = screen.width;
    var vheight= screen.height;
    window.open(url,"menubar=0,toolbar=0,left=0,top=0,location=0,status=0,scrollbars=yes,width="+vwidth+",height="+vheight)
}

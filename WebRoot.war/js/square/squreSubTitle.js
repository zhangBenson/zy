
//获取标题的子字符串
function getSubstringForCourseName(str){
         var letterExp = /[u00-uFF]/;
         var len = 0;
         for (var j = 0; j < str.length; j++) {
            var c = str.charAt(j);
            if (letterExp.test(c) || c==" ") {
                len++;
            }else {
                len += 2;
            }
            if(len > 28){
               return str.substring(0,j)+"...";
            }
         }
         return str;
}
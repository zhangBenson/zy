//它将jquery系列化后的值转为name:value的形式
function convertArray(objs) {

    var json = {};
    $(objs).each(function (index, item) {
        if (typeof json[this.name] == 'undefined') {
            json[this.name] = this.value;
        } else {
            if (json[this.name] instanceof Object) {
                json[this.name].push(this.value);
            } else {
                json[this.name] = new Array(json[this.name]);
                json[this.name].push(this.value);
            }
        }
    });

    return json;
}

//得到字符串的长度
function getStrLength(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        var c = str.charCodeAt(i);
        if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
            len++;
        } else {
            len += 2;
        }
    }
    return len;
}

function getSubString(str, sLength) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        var c = str.charCodeAt(i);
        if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
            len++;
        } else {
            len += 2;
        }
        if (len > sLength) {
            return str.substring(0, i);
        } else if (len == sLength) {
            return str.substring(0, i + 1);
        }
    }
    return str;
}

function changeWordNumber(inputId, tipId, maxLength) {
    var $input = $("#" + inputId);
    var $tip = $("#" + tipId);
    var str = $.trim($input.val());
    var exist_words_number = getStrLength(str);
    if (exist_words_number >= maxLength) {
        var partStr = getSubString(str, maxLength);
        $input.val(partStr);
        exist_words_number = maxLength;
    }
    $tip.html(exist_words_number + "/" + maxLength);
}

//浮点数校验
function checkDoubleNumber(id, tipId, emptyMsg, wrongMsg) {
    if (!checkEmpty(id, tipId, emptyMsg)) {
        return false;
    }
    var $tip = $("#" + tipId);
    var numStr = $.trim($("#" + id).val());
    var numExp = /(^[1-9]\d*(\.\d*)?)|(0\.\d*[1-9]\d*)/;
    if (!numExp.test(numStr)) {
        $("#" + tipId).html(wrongMsg);
        return false;
    }

    $tip.html("");
    return true;
}

//正整数校验
function checkNumber(id, tipId, emptyMsg, wrongMsg) {
    if (!checkEmpty(id, tipId, emptyMsg)) {
        return false;
    }
    var $tip = $("#" + tipId);
    var numStr = $.trim($("#" + id).val());
    var numExp = /^[1-9]\d*$/;
    if (!numExp.test(numStr)) {
        $("#" + tipId).html(wrongMsg);
        return false;
    }

    $tip.html("");
    return true;
}

//时间校验
function checkTime(id, tipId, emptyMsg, wrongMsg, lessMsg) {
    if (!checkEmpty(id, tipId, emptyMsg)) {
        return false;
    }

    var $tip = $("#" + tipId);
    var startTime = $.trim($("#" + id).val()).replace(/-/g, "/");
    try {
        startTime = Date.parse(startTime);
    } catch (ex) {
        $("#" + tipId).html(wrongMsg);
        return false;
    }

    var timeNow = new Date();
    if (startTime <= timeNow) {
        $("#" + tipId).html(lessMsg);
        return false;
    }

    $tip.html("");
    return true;
}

function checkMinLength(id, tipId, minLength, tipMsg) {
    var $tip = $("#" + tipId);
    var str = $.trim($("#" + id).val());
    if (str && getStrLength(str) < minLength) {
        if (!tipMsg) {
            $tip.html("不能超过" + minLength + "字");
        } else {
            $tip.html(tipMsg);
        }
        return false;
    }

    $tip.html("");
    return true;
}

function checkLength(id, tipId, maxLength, tipMsg) {
    var $tip = $("#" + tipId);
    var str = $.trim($("#" + id).val());
    if (str && getStrLength(str) > maxLength) {
        if (!tipMsg) {
            $tip.html("不能超过" + Math.ceil(maxLength / 2) + "字（英文" + maxLength + "）");
        } else {
            $tip.html(tipMsg);
        }
        return false;
    }

    $tip.html("");
    return true;
}


/**
 * 验证input textarea是否为空，并提示
 * @param id
 * @param tipId
 * @param tipMsg
 */
function checkEmpty(id, tipId, tipMsg) {
    var $tip = $("#" + tipId);
    var str = $.trim($("#" + id).val());
    if (!str) {
        if (!tipMsg) {
            $tip.html("输入不能为空");
        } else {
            $tip.html(tipMsg);
        }
        return false;
    }

    $tip.html("");
    return true;
}

//HTML 转义
function html_encode(str) {
    var s = "";
    if (str.length == 0) return "";
    s = str.replace(/&/g, "&gt;");
    s = s.replace(/</g, "&lt;");
    s = s.replace(/>/g, "&gt;");
    s = s.replace(/ /g, "&nbsp;");
    s = s.replace(/\'/g, "&#39;");
    s = s.replace(/\"/g, "&quot;");
    s = s.replace(/\n/g, "<br>");
    return s;
}

//HTML 反转义
function html_decode(str) {
    var s = "";
    if (str.length == 0) return "";
    s = str.replace(/&gt;/g, "&");
    s = s.replace(/&lt;/g, "<");
    s = s.replace(/&gt;/g, ">");
    s = s.replace(/&nbsp;/g, " ");
    s = s.replace(/&#39;/g, "\'");
    s = s.replace(/&quot;/g, "\"");
    s = s.replace(/<br>/g, "\n");
    return s;
}

//平滑跳转到某个位置
function moveTo(destId) {
    $("html,body").animate({scrollTop: $("#" + destId).offset().top - 30}, 500);
}

function moveToExact(topPixes) {
    $("html,body").animate({scrollTop: topPixes}, 500);
}
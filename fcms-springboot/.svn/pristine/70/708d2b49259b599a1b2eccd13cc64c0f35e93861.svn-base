
function OpenWindow(url, title, width, height) {
    var wWin = window.screen.width;
    var hHei = window.screen.height;
    var left = (wWin - width) / 2;
    var top = (hHei - height) / 2;
    var setting = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;
    setting += ',titlebar=no,menubar=no,toolbar=no,location=no,status=no,scrollbars=no,resizable=no';
    window.open(url, title, setting);
}

function GetIDs(data, id) {
    var idsArray = new Array();
    if (data.length > 0) {
        $.each(data, function (key, value) {
            idsArray[key] = data[key][id];
        });
    }
    return idsArray.join(',');
}

//data是形如[{key:1,value:一,...},{key:2,value:二,...},...]
var targetControl = null;
function SingleCallBack(data) {
    if (data.length > 0) {
        $("#txt" + targetControl).val(data[0].value);
        $("#hf" + targetControl).val(data[0].key);
    }
    else {
        $("#txt" + targetControl).val("");
        $("#hf" + targetControl).val("");
    }
}

var ComSelect = {
    //一般通用选择（自动值直接加到文本框和隐藏控件上）
    SelectSingle: function (_title, _url, _width, _height, _targetControl) {
        var param = "callfun=SingleCallBack&multi=false&hfTargetID=hf" + _targetControl + "&limitNum=1";
        _url.indexOf("?") > 0 ? _url += "&" + param : _url += "?" + param;
        targetControl = _targetControl;
        OpenWindow(_url, _title, _width, _height)
    },

    //自定义通用选择，调用用户特定的方法
    SelectWithCallBack: function (_title, _url, _width, _height, _callFun, _targetControlID, _limitNum) {
        var param = "callfun=" + _callFun + "&multi=true&hfTargetID=" + _targetControlID + "&limitNum=" + _limitNum;
        _url.indexOf("?") > 0 ? _url += "&" + param : _url += "?" + param;
        OpenWindow(_url, _title, _width, _height)
    }
}

function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}

function CallOpenerMethod(data) {
    var callFun = GetQueryString("callfun");

    window.opener[callFun](data);
    window.close();
}

function GetSelectedIDArray() {
    var targetControlID = GetQueryString("hfTargetID");

    var selectedIDs = $("#" + targetControlID, opener.document).val();
    var selectIDArray;
    if (selectedIDs != "undefined" || selectedIDs != "") {
        selectIDArray = selectedIDs.split(',');
    }
    return selectIDArray;
}

function SelectedDefault() {
    var selectIDArray = GetSelectedIDArray();

    $.each(selectIDArray, function (key, value) {
        $(".dataTable tbody tr[trid=" + value + "]").find(":checkbox").attr("checked", "checked");
    });
}



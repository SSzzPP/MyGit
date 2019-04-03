//把json字符串转换为时间格式
function ChangeDateFormat(cellval) {
    try {
        var date = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        return date.getFullYear() + "-" + month + "-" + currentDate;
    } catch (e) {
        return "";
    }
}
//把json字符串转换为长时间格式
function ChangeLongDateFormat(cellval) {
    try {
        var date = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        var Hours = date.getHours();
        var Minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
        var Second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
        return date.getFullYear() + "-" + month + "-" + currentDate + " " + Hours + ":" + Minute + ":" + Second;
    } catch (e) {
        return "";
    }
}
//把json字符串转换为时间格式，内部调用ChangeDateFormat方法
function formatDate(val) {
    return ChangeDateFormat(val);
}

function formateDateSet(val) {
    if (val == null || val == undefined)
        return;
    val = val.replace("/", "-");
    val = val.replace("/", "-");
    val = val.replace("0:00:00", "");
    return val;
}

function myformatter(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return y + '-' + (m < 10 ? ('0' + m) : m) + '-'
    + (d < 10 ? ('0' + d) : d);
}
function myparser(s) {
    if (!s)
        return new Date();
    var ss = (s.split('-'));
    var y = parseInt(ss[0], 10);
    var m = parseInt(ss[1], 10);
    var d = parseInt(ss[2], 10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
        return new Date(y, m - 1, d);
    } else {
        return new Date();
    }
}

//取地址栏参数
Request = {
    QueryString: function (item) {
        var svalue = location.search.match(new
    RegExp('[\?\&]' + item + '=([^\&]*)(\&?)', 'i'));
        return svalue ? svalue[1] : svalue;
    }
}

var myview = $.extend({}, $.fn.datagrid.defaults.view, {
    onAfterRender: function (target) {
        $.fn.datagrid.defaults.view.onAfterRender.call(this, target);
        var opts = $(target).datagrid('options');
        var vc = $(target).datagrid('getPanel').children('div.datagrid-view');
        vc.children('div.datagrid-empty').remove();
        if (!$(target).datagrid('getRows').length) {
            var d = $('<div class="datagrid-empty" fit="true"></div>').html(opts.emptyMsg || 'no records').appendTo(vc);
            d.css({
                position: 'absolute',
                left: 0,
                top: '50%',
                width: '100%',
                textAlign: 'center'
            });
        }
    }
});

function emptyDataTip() {
    var list = [];//数据列表为空
    $('.easyui-datagrid').datagrid({
        data: list,
        view: myview,
        emptyMsg: '无数据...'
    });
}

/// <summary>
/// 弹出等待效果框
/// </summary>
function ajaxLoading() {
    $("<div class=\"datagrid-mask\" style=z-index:99990'></div>").css({ display: "block", width: "100%", height: $(window).height() }).appendTo("body");
    $("<div class=\"datagrid-mask-msg\" style='font-size:12px;z-index:99999'></div>").html(loadingMsg).appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(window).height() - 45) / 2 });
}
/// <summary>
/// 停止等待效果框
/// </summary>
function ajaxLoadEnd() {
    $(".datagrid-mask").remove();
    $(".datagrid-mask-msg").remove();
}
//操作提示
var msgTitle = "操作提示";
//未选择要编辑的数据提示
var noSelectedEditTip = "请选择要编辑的行！";
//多选了的提示(编辑)
var multiSelectedEditTip = "只能对一行进行编辑！";
//未选择任何项提示
var noSelectedDetailTip = "请选择要查看的行！";
//多选了的提示(查看)
var multiSelectedDetailTip = "只能对一行进行查看！";
//未选择提示(删除)
var noSelectedDelTip = "请选择要删除的行！";
//确定删除前提示
var delectedTip = "确定删除选择的数据吗？";
//数据添加成功提示
var addSuccessTip = "数据添加成功。";
//数据修改成功提示
var updateSuccessTip = "数据修改成功。";
//数据删除成功提示
var deleteSuccessTip = "数据删除成功。";
//保存成功提示
var saveSuccessTip = "保存成功。";
//生效成功提示
var takeEffectSuccessTip = "生效成功。"
//禁用成功提示
var disableSuccessTip = "禁用成功。";
//数据添加失败提示
var addFailTip = "数据添加失败！";
//数据修改失败提示
var updateFailTip = "数据修改失败！";
//数据删除失败提示
var deleteFailTip = "数据删除失败！";
//保存失败提示
var saveFailTip = "保存失败！";
//生效失败提示
var takeEffectFailTip = "生效失败！";
//禁用失败提示
var disableFailTip = "禁用失败！";
//只能对一行进行操作提示
var multiSelectedHandle = "只能对一行进行操作！";
//正在处理，请稍后... (加载数据用)
var loadingMsg = "正在处理，请稍后...";
//您没有访问该组织的权限 
var noPermissionTip = "您没有访问该组织的权限！";
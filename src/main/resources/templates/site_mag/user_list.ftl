<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mag/style/idialog.css" rel="stylesheet" id="lhgdialoglink">
<title>用户管理</title>
<script type="text/javascript" src="/mag/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/mag/js/lhgdialog.js"></script>
<script type="text/javascript" src="/mag/js/layout.js"></script>
<link href="/mag/style/pagination.css" rel="stylesheet" type="text/css">
<link href="/mag/style/style.css" rel="stylesheet" type="text/css">
</head>
<style type="text/css">
    .win_out{
    position:fixed;
    overflow: hidden;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 999999999999999999;
    background:rgba(0,0,0,0.7);
}
.win_out dl{
    background: white;
    margin: auto;
    width: 400px;
    height:188px;
    border-radius: 10px;
    margin-top: 260px;
}
.win_out dt{
    float: left;
    width: 100%;
}
.win_out dt span{
    float: left;
    width: 50%;
    line-height: 50px;
    text-align: center;
    font-size: 20px;
    color: #333333;
}
.win_out dd{
    float: left;
    width: 90%;
    padding:0 5%;
}
.win_out dd input{
    float: left;
    width: 70%;
    padding-left: 5%;
    height: 30px;
    border: #DDDDDD 1px solid;
    color: #999999;
    font-size: 16px;
}
.win_out dd div{
    overflow: hidden;
    margin-top: 20px;
}
.win_out dd label{
    display: block;
    float: left;
    width: 72px;
    line-height: 32px;
    text-align: center;
}
.win_out dd .btn{
    width: 60px;
    background: #008be8;
    color: white;
    font-size: 18px;
    border-bottom: none;
    outline: none;
    height: 40px;
}
.win_out dd span{
    width: 60px;
    background: #008be8;
    color: white;
    font-size: 18px;
    display: block;
    text-align: center;
    height: 30px;
    line-height:30px;
    margin-top: 10px;
    border-radius: 4px;
}
    </style>
<body class="mainbody"><div class="" style="left: 0px; top: 0px; visibility: hidden; position: absolute;"><table class="ui_border"><tbody><tr><td class="ui_lt"></td><td class="ui_t"></td><td class="ui_rt"></td></tr><tr><td class="ui_l"></td><td class="ui_c"><div class="ui_inner"><table class="ui_dialog"><tbody><tr><td colspan="2"><div class="ui_title_bar"><div class="ui_title" unselectable="on" style="cursor: move;"></div><div class="ui_title_buttons"><a class="ui_min" href="javascript:void(0);" title="最小化" style="display: inline-block;"><b class="ui_min_b"></b></a><a class="ui_max" href="javascript:void(0);" title="最大化" style="display: inline-block;"><b class="ui_max_b"></b></a><a class="ui_res" href="javascript:void(0);" title="还原"><b class="ui_res_b"></b><b class="ui_res_t"></b></a><a class="ui_close" href="javascript:void(0);" title="关闭(esc键)" style="display: inline-block;">×</a></div></div></td></tr><tr><td class="ui_icon" style="display: none;"></td><td class="ui_main" style="width: auto; height: auto;"><div class="ui_content" style="padding: 10px;"></div></td></tr><tr><td colspan="2"><div class="ui_buttons" style="display: none;"></div></td></tr></tbody></table></div></td><td class="ui_r"></td></tr><tr><td class="ui_lb"></td><td class="ui_b"></td><td class="ui_rb" style="cursor: se-resize;"></td></tr></tbody></table></div>

<!-- 弹出框 -->
<script type="text/javascript" src="/mag/js/Rich_Lee.js"></script>
<script type="text/javascript" src="/mag/js/Validform_v5.3.2_min.js"></script>
<script>
$(document).ready(function(){
//初始化表单验证
    $("#form").Validform({
        tiptype:4, 
        ajaxPost:true,
        callback:function(data){
            alert(data.msg);
            if(data.code==1)
            {
                window.location.href="/Verwalter/login";
            }
            else if(data.code==2){
                window.location.href="/Verwalter/user/list";
            }
        }
    });
});
 function win_show(){
        var oUt = rich('.win_out')[0];
        oUt.style.display = 'block';
    };
    function win_hide(){
        var oUt = rich('.win_out')[0];
        oUt.style.display = 'none';
    };
</script>
<div class="win_out" style="display: none;">
    <dl>    
        <dt>
        </dt>
        <dd>
            <form action="/Verwalter/user/saveMore" method="post" id="form">
                <div>
                    <label>区县</label>
                    <input class="text" type="text" name="county" id="" placeholder="请输入区县简称，如：CQ" />
                </div>
                <div>
                    <label>卡号区间</label>
                    <input style="width: 100px;" class="text" type="number" name="start" id=""/><a style="float: left;line-height: 32px;padding: 0 10px;">~</a>
                    <input style="width: 100px;" class="text" type="number" name="endNumber" id=""/>
                </div>
                <span style="margin-top: 30px;float: left;margin-left: 30px;" >
                <input type="submit" value="确定" style="width:60px;height:30px;background:#008be8;color:white; border-radius: 4px;border:none;out-line:none;"></input></span>
                <a href="javascript:;"><span style="margin-top: 30px;float: right;margin-right: 30px;" onclick="win_hide();">取消</span></a>
            </form>
        </dd>
    </dl>
</div>

<form name="form1" method="post" action="/Verwalter/user/list" id="form1">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="${__EVENTTARGET!""}">
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="${__EVENTARGUMENT!""}">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="${__VIEWSTATE!""}" >
</div>

<script type="text/javascript">
var theForm = document.forms['form1'];
    if (!theForm) {
        theForm = document.form1;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }
</script>
<!--导航栏-->
<div class="location" style="position: static; top: 0px;">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="/Verwalter/center" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>会员管理</span>
  <i class="arrow"></i>
  <span>会员列表</span>  
</div>
<!--/导航栏-->

<!--工具栏-->
<div class="toolbar-wrap">
  <div id="floatHead" class="toolbar" style="position: static; top: 42px;">
    <div class="l-list">
      <ul class="icon-list">
        <li><a class="add" href="/Verwalter/user/edit"><i></i><span>新增</span></a></li>
        <li><a class="add" href="javascript:win_show();"><i></i><span>批量增加</span></a></li>
        <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
        <li><a onclick="return ExePostBack('btnDelete');" id="btnDelete" class="del" href="javascript:__doPostBack('btnDelete','')"><i></i><span>删除</span></a></li>
      </ul>
      <div class="menu-list">
        <div class="rule-single-select">
            <select name="statusId" onchange="javascript:setTimeout(__doPostBack('statusId',''), 0)">
                 <option value="" <#if !statusId?? || statusId==0>selected="selected"</#if>>所有会员</option>
                 <option value="1" <#if statusId?? && statusId==1>selected="selected"</#if>>已激活</option>
                 <option value="2" <#if statusId?? && statusId==2>selected="selected"</#if>>未激活</option>
                 <option value="3" <#if statusId?? && statusId==3>selected="selected"</#if>>已过期</option>
                 <option value="4" <#if statusId?? && statusId==4>selected="selected"</#if>>未售出</option>
            </select>
        </div>
    </div>
      <#--
      <div class="menu-list">
        <div class="rule-single-select single-select">
        <select name="roleId" onchange="javascript:setTimeout(__doPostBack('roleId',''), 0)" style="display: none;">
        	<option <#if !roleId??>selected="selected"</#if> value="">所有用户组</option>
        	<option <#if roleId?? && roleId==0>selected="selected"</#if> value="0">普通会员</option>
        	<option <#if roleId?? && roleId==1>selected="selected"</#if> value="1">同盟店</option>
        </select>
        </div>
      </div>
      -->
    </div>
    <div class="r-list">
      <input name="keywords" type="text" class="keyword" value="${keywords!""}">
      <a id="lbtnSearch" class="btn-search" href="javascript:__doPostBack('btnSearch','')">查询</a>
    </div>
  </div>
</div>
<!--/工具栏-->

<!--列表-->

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
  <tbody>
  <tr class="odd_bg">
    <th width="8%">选择</th>
    <th align="left" colspan="2">用户名</th>
    <th align="left" width="6%">VIP卡号</th>
    <th align="center" width="12%">开户城市</th>
    <th width="12%">手机号</th>
    <th width="8%">总量（箱）</th>
    <th width="8%">剩余量（箱）</th>
    <th width="6%">状态</th>
    <th width="6%">操作</th>
    </tr>
    <#if user_page??>
    <#list user_page.content as user>
        <tr>
            <td align="center">
                <span class="checkall" style="vertical-align:middle;">
                    <input id="listChkId" type="checkbox" name="listChkId" value="${user_index}" >
                </span>
                <input type="hidden" name="listId" id="listId" value="${user.id?c}">
            </td>
            <td width="64">
              <a href="/Verwalter/user/edit?id=${user.id?c}">
                <img width="64" height="64" src="${user.headImageUri!"/mag/style/user_avatar.png"}">
              </a>
            </td>
            <td>
              <div class="user-box">
                <h4><b>${user.username!""}</b> (姓名：${user.realName!""})</h4>
                <i>激活时间：${user.registerTime!""}</i>
                <#--
                <span>
                  <a class="amount" href="/Verwalter/user/point/list?userId=${user.id?c}" title="粮草">粮草</a>
                  <a class="point" href="/Verwalter/user/collect/list?userId=${user.id?c}" title="收藏商品">收藏商品</a>
                  <a class="msg" href="/Verwalter/user/recent/list?userId=${user.id?c}" title="浏览历史">浏览历史</a>
                  <#if user.roleId?? && user.roleId==1>
                      <a class="sms" href="/Verwalter/user/reward/list?userId=${user.id?c}" title="返现记录">返现记录</a>
                  </#if>
                </span>
                -->
              </div>
            </td>
            <td>${user.vipCard!''}</td>
            <td align="center">${user.province!""}-${user.city!''}-${user.district!''}</td>
            <td align="center">${user.mobile!""}</td>
            <td align="center"><#if user.totalNumber??>${user.totalNumber!'0'}<#else>0</#if></td>
            <td align="center"><#if user.leftNumber??>${user.leftNumber!'0'}<#else>0</#if></td>
            <td align="center">
                <#if user.statusId?? && user.statusId==1>
                    已激活
                <#elseif user.statusId?? && user.statusId==2>
                    未激活
                <#elseif user.statusId?? && user.statusId==3>
                    已过期
                <#else>
                    未售出
                </#if>
            </td>
            <td align="center">
                <a href="/Verwalter/user/edit?id=${user.id?c}&roleId=${roleId!""}">修改</a> | 
                <a href="/Verwalter/user/edit?id=${user.id?c}&roleId=${roleId!""}&action=view">查看</a></td>
          </tr>
    </#list>
</#if>
     
</tbody>
</table>

<!--/列表-->

<!--内容底部-->
<#assign PAGE_DATA=user_page />
<#include "/site_mag/list_footer.ftl" />
<!--/内容底部-->
</form>


</body></html>
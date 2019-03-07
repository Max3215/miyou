<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mag/style/idialog.css" rel="stylesheet" id="lhgdialoglink">
<title>编辑会员信息</title>
<script type="text/javascript" src="/mag/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/mag/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/mag/js/lhgdialog.js"></script>
<script type="text/javascript" src="/mag/js/WdatePicker.js"></script>
<script type="text/javascript" src="/mag/js/swfupload.js"></script>
<script type="text/javascript" src="/mag/js/swfupload.queue.js"></script>
<script type="text/javascript" src="/mag/js/swfupload.handlers.js"></script>
<script type="text/javascript" src="/mag/js/layout.js"></script>
<link href="/mag/style/style.css" rel="stylesheet" type="text/css">
<link href="/mag/style/WdatePicker.css" rel="stylesheet" type="text/css">
<script src="/mag/js/jquery.cityselect.js"></script>
<script type="text/javascript">
$(function () {
    //初始化表单验证
    $("#form_user").initValidform();
    
     $("#address").citySelect({
        nodata:"none",
        <#if user?? && user.province??>prov: "${user.province!''}",</#if>
        <#if user?? && user.city??>city: "${user.city!''}",</#if>
        <#if user?? && user.disctrict??>dist: "${user.disctrict!''}",</#if>
        required:false
    });

    //初始化上传控件
    $(".upload-img").each(function () {
        $(this).InitSWFUpload({ 
            sendurl: "/Verwalter/upload", 
            flashurl: "/mag/js/swfupload.swf"
        });
    });

        //（缩略图）
    var txtPic = $("#txtImgUrl").val();
    if (txtPic == "" || txtPic == null) {
        $(".thumb_ImgUrl_show").hide();
    }
    else {
        $(".thumb_ImgUrl_show").html("<ul><li><div class='img-box1'><img src='" + txtPic + "' bigsrc='" + txtPic + "' /></div></li></ul>");
        $(".thumb_ImgUrl_show").show();
    }

    $("#txtImgUrl").blur(function () {
        var txtPic = $("#txtImgUrl").val();
        if (txtPic == "" || txtPic == null) {
            $(".thumb_ImgUrl_show").hide();
        }
        else {
            $(".thumb_ImgUrl_show").html("<ul><li><div class='img-box1'><img src='" + txtPic + "' bigsrc='" + txtPic + "' /></div></li></ul>");
            $(".thumb_ImgUrl_show").show();
        }
    });  
    
    //设置封面图片的样式
    $(".photo-list ul li .img-box img").each(function () {
        if ($(this).attr("src") == $("#hidFocusPhoto").val()) {
            $(this).parent().addClass("selected");
        }
    });
    
    $("#btnEditRemark").click(function () { EditOrderRemark(); });    //修改粮草备注 
});   

   //修改粮草备注
        function EditOrderRemark() {
            var dialog = $.dialog({
                title: '修改粮草备注',
                content: '<input type="checkbox" name="showtype" id="showtype" checked="checked"/><label> 仅后台显示</label> </br><textarea id="pointRemark" name="txtPointRemark" rows="2" cols="20" class="input"></textarea>',
                min: false,
                max: false,
                lock: true,
                ok: function () {
                    var showtype = $("#showtype", parent.document).is(':checked');                    
                    var remark = $("#pointRemark", parent.document).val();                   
                    if (remark == "") {
                        $.dialog.alert('对不起，请输入备注内容！', function () { }, dialog);
                        return false;
                    }
                    var userId = eval(document.getElementById("userId")).value;
                    var point = eval(document.getElementById("totalPoints")).value;
                    var postData = { "userId": userId, "totalPoints": point, "data": remark, "type":"editPoint", "isBackgroundShow": showtype};
                    //发送AJAX请求
                    sendAjaxUrl(dialog, postData, "/Verwalter/user/param/edit");
                    return false;
                },
                cancel: true
            });
        }
    //发送AJAX请求
        function sendAjaxUrl(winObj, postData, sendUrl) {
            $.ajax({
                type: "post",
                url: sendUrl,
                data: postData,
                dataType: "json",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    $.dialog.alert('尝试发送失败，错误信息：' + errorThrown, function () { }, winObj);
                },
                success: function (data) {
                    if (data.code == 0) {
                        winObj.close();
                        $.dialog.tips(data.msg, 2, '32X32/succ.png', function () { location.reload(); }); //刷新页面
                    } else {
                        $.dialog.alert('错误提示：' + data.message, function () { }, winObj);
                    }
                }
            });
        }     
</script>
</head>

<body class="mainbody">
<form name="form_user" method="post" action="/Verwalter/user/save" id="form_user">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="${__VIEWSTATE!""}" >
<input type="hidden" id="userId" name="userId" value="<#if user??>${user.id?c!""}</#if>" >
</div>
<!--导航栏-->
<div class="location" style="position: static; top: 0px;">
  <a href="/Verwalter/user/list?roleId=${roleId!""}"><i></i><span>返回列表页</span></a>
  <a href="/Verwalter/center" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>会员管理</span>
  <i class="arrow"></i>
  <span>编辑会员信息</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab" style="position: static; top: 52px;">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">基本资料</a></li>
        <li><a href="javascript:;" onclick="tabs(this);">交易记录</a></li>
        <#--
        <li><a href="javascript:;" onclick="tabs(this);">账户信息</a></li>
        -->
      </ul>
    </div>
  </div>
</div>

<!--基本资料-->
<div class="tab-content">
  <dl>
    <dt>用户状态</dt>
    <dd>
      <div class="rule-multi-radio">
        <span id="rblStatus">
            <input type="radio" name="statusId" value="1" datatype="n" <#if user?? && user.statusId?? && user.statusId==1>checked="checked"</#if>>
            <label>已激活</label>
            <input type="radio" name="statusId" value="2" datatype="n" <#if user?? && user.statusId?? && user.statusId==2>checked="checked"</#if>>
            <label>未激活</label>
            <input type="radio" name="statusId" value="3" datatype="n" <#if user?? && user.statusId?? && user.statusId==3>checked="checked"</#if>>
            <label>已过期</label>
            <input type="radio" name="statusId" value="4" datatype="n" <#if !user?? || user.statusId?? && user.statusId==4>checked="checked"</#if>>
            <label>未售出</label>
        </span>
      </div>
      <span class="Validform_checktip"></span>
    </dd>
  </dl>
    <dl>
        <dt>VIP号：</dt>
        <dd>
            <#if user??>
                <span readonly="readonly">${user.vipCard!""}</span>
            <#else>
                <input name="vipCard" type="text" maxlength="200" class="input normal" datatype="s6-20" ajaxurl="/Verwalter/user/check<#if user??>?id=${user.id?c}</#if>" sucmsg=" " minlength="2">
            </#if>
            <span class="Validform_checktip"></span>
        </dd>
    </dl>
     <dl>
    <dt>激活码</dt>
    <dd>
        <input name="cardKey" type="text" value="<#if user??>${user.cardKey!''}</#if>" class="input normal"  nullmsg="请输入激活码" errormsg="" sucmsg=" " > 
        <span class="Validform_checktip">*VIP卡激活码，随机发送</span>
    </dd>
  </dl>
  <dl>
        <dt>开户城市</dt>
        <dd>
            <div id="address">
               <select name="province" class="prov" style="width: 100px;" datatype="*"></select>
               <select name="city" class="city" style="width: 100px;" datatype="*"></select>
               <select name="district" class="dist" style="width: 100px;" datatype="*0-10"></select>
            </div>
        </dd>
  </dl>
  <dl>
    <dt>详细地址</dt>
    <dd><input name="detailAddress" type="text" value="<#if user??>${user.detailAddress!""}</#if>" class="input normal"></dd>
  </dl>
  <dl>
    <dt>真实姓名</dt>
    <dd><input name="realName" type="text" value="<#if user??>${user.realName!""}</#if>" class="input normal"></dd>
  </dl>
  <dl>
    <dt>上传头像</dt>
    <dd>
        <input id="txtImgUrl" name="headImageUri" type="text" value="<#if user??>${user.headImageUri!""}</#if>" class="input normal upload-path">
        <div class="upload-box upload-img"></div>
        <div class="photo-list thumb_ImgUrl_show">
            <ul>
                <li>
                    <div class="img-box1"></div>
                </li>
            </ul>
        </div>
    </dd>
  </dl>
  <dl>
    <dt>用户性别</dt>
    <dd>
      <div class="rule-multi-radio multi-radio">
        <span style="display: none;">
        <input type="radio" name="sex" value="保密" <#if !user?? || !user.sex?? || user.sex=="保密">checked="checked"</#if>>
        <label>保密</label>
        <input type="radio" name="sex" value="男" <#if user?? && user.sex?? && user.sex=="男">checked="checked"</#if>>
        <label>男</label>
        <input type="radio" name="rblSex" value="女" <#if user?? && user.sex?? && user.sex=="女">checked="checked"</#if>>
        <label>女</label>
        </span>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>激活日期</dt>
    <dd>
      <div class="input-date">
        <input name="registerTime" type="text" value="<#if user??>${user.registerTime!""}</#if>" class="input date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" ">
      </div>
        <span class="Validform_checktip">默认为当前时间</span>
    </dd>
  </dl>
  <dl>
    <dt>会员有效期</dt>
    <dd>
      <div class="input-date">
        <input name="registerTime" type="text" disabled="disabled" value="<#if user??>${user.exceedTime!""}</#if>" class="input date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" sucmsg=" ">
      </div>
        <span class="Validform_checktip">激活后两年内有效</span>
    </dd>
  </dl>
  <dl>
    <dt>库存总量</dt>
    <dd>
        <input name="totalNumber"  type="text" class="input" value="<#if user?? && user.totalNumber??>${user.totalNumber!'0'}<#else>60</#if>"  datatypr="/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/" />
        <span class="Validform_checktip">*当前账户库存总量</span>
    </dd>
  </dl>
 <dl>
    <dt>个人库存</dt>
    <dd>
        <input name="leftNumber"  type="text" class="input" value="<#if user?? && user.leftNumber??>${user.leftNumber!'0'}<#else>60</#if>"  datatypr="/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/"/>
        <span class="Validform_checktip">*当前账户剩余库存量</span>
    </dd>
  </dl>
  <dl>
    <dt>手机号码</dt>
    <dd><input name="mobile" type="text" value="<#if user??>${user.mobile!""}</#if>" class="input normal" ignore="ignore" datatype="m" sucmsg=" " ></dd>
  </dl>
  
</div>
<!--/安全设置-->
<div class="tab-content" style="display:none;">
    <dl>
            <dt>交易记录</dt>
            <dd>
                <table border="0" cellspacing="0" cellpadding="0" class="border-table" width="98%">
                    <thead>
                        <tr>
                            <th width="12%">
                                订单号
                            </th>
                            <th>
                                交易说明
                            </th>
                            <th width="10%">
                                数量
                            </th>
                            <th width="12%">
                                记录时间
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <#if record_list??>
                            <#list record_list as re>
                                <tr class="td_c">
                                    <td>${re.orderNumber!""}</td>
                                    <td >
                                        ${re.cont!''}
                                    </td>
                                    <td>${re.number!"0"}</td>
                                    <td>${re.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                </tr>
                            </#list>
                        </#if>
                    </tbody> 
                </table> 
            </dd> 
        </dl>
</div>

<!--/账户信息-->


<!--借款标的-->

<!--/借款标的-->

<!--投资标的-->

<!--/投资标的-->

<!--资金明细-->

<!--/资金明细-->

<!--工具栏-->
<div class="page-footer">
  <div class="btn-list">
    <input type="submit" name="btnSubmit" value="提交保存" id="btnSubmit" class="btn">
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);">
  </div>
  <div class="clear"></div>
</div>
<!--/工具栏-->

</form>


</body></html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mag/style/idialog.css" rel="stylesheet" id="lhgdialoglink">
<title>查看订单信息</title>
<script type="text/javascript" src="/mag/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/mag/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/mag/js/lhgdialog.js"></script>
<script type="text/javascript" src="/mag/js/layout.js"></script>
<link href="/mag/style/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        $(function () {
            $("#btnConfirm").click(function () { OrderConfirm(); });   //确认订单
            $("#btnPayment").click(function () { OrderPayment(); });   //确认付款
            $("#btnPaymentLeft").click(function () { OrderPaymentLeft(); });   //确认发货
            $("#btnService").click(function () { OrderService(); });   //确认收货

            $("#btnOrderComplete").click(function () { OrderComplete(); }); //完成订单
            $("#btnCancel").click(function () { OrderCancel(); });     //取消订单
            $("#btnPrint").click(function () { OrderPrint(); });       //打印订单
            $("#btnEditRemark").click(function () { EditOrderRemark(); });    //修改订单备注
        });

        //确认收货
        function OrderReceive() {
            var dialog = $.dialog.confirm('该步骤将确认收货，确认要继续吗？', function () {
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "orderReceive" };
                //发送AJAX请求
                sendAjaxUrl(dialog, postData, "/Verwalter/order/param/edit");
                return false;
            });

        }
        //货到付款 确认收货
        function OrderHDFKReceive() {
            var dialog = $.dialog.confirm('该步骤将确认收货，确认要继续吗？', function () {
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "orderReceive" };
                //发送AJAX请求
                sendAjaxUrl(dialog, postData, "/Verwalter/order/param/edit");
                return false;
            });

        }

        //确认订单
        function OrderConfirm() {
            var dialog = $.dialog.confirm('确认订单后将无法修改金额，确认要继续吗？', function () {
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "orderConfirm" };
                //发送AJAX请求
                sendAjaxUrl(dialog, postData, "/Verwalter/order/param/edit");
                return false;
            });
        }
        
        //确认付款
        function OrderPayment() {
            var dialog = $.dialog.confirm('操作提示信息：<br />确认已经收到用户付款，确认要继续吗？', function () {
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "orderPay" };
                //发送AJAX请求
                sendAjaxUrl(dialog, postData, "/Verwalter/order/param/edit");
                return false;
            });
        }
        
        //确认发货
        function OrderPaymentLeft() {
            var dialog = $.dialog.confirm('操作提示信息：<br />确认收款并切已经发货，确认要继续吗？', function () {
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "orderPayLeft" };
                //发送AJAX请求
                sendAjaxUrl(dialog, postData, "/Verwalter/order/param/edit");
                return false;
            });
        }
        
        //确认到店消费
        function OrderService() {
            var dialog = $.dialog.confirm('操作提示信息：<br />确认用户已经收到商品？', function () {
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "orderService" };
                //发送AJAX请求
                sendAjaxUrl(dialog, postData, "/Verwalter/order/param/edit");
                return false;
            });
        }

        //确认发货
        function OrderExpress() {
            var orderNumber = $.trim($("#spanOrderNumber").text());
            var dialog = $.dialog({
                title: '确认发货',
                content: 'url:/Verwalter/order/dialog/delivery?orderNumber=' + orderNumber,
                min: false,
                max: false,
                lock: true,
                width: 450,
                height:350
            });
        }
        
        //确认完成
        function OrderComplete() {
             var dialog = $.dialog.confirm('确认后用户将不能进行评价，是否继续？', function () {
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "orderFinish" };
                //发送AJAX请求
                sendAjaxUrl(dialog, postData, "/Verwalter/order/param/edit");
                return false;
            });
        }

        //取消订单
        function OrderCancel() {
            var dialog = $.dialog({
                title: '取消订单',
                content: '操作提示信息：<br />1、该订单为线上支付订单，请先确定购买者是否真的不需要继续支付；<br />2、取消的订单，将不在购买流程中显示，您可以到取消的订单中查阅；<br />3、请单击相应按钮继续下一步操作！',
                min: false,
                max: false,
                lock: true,
                icon: 'confirm.gif',
                button: [{
                    name: '直接取消',
                    callback: function () {
                        var orderNumber = $.trim($("#spanOrderNumber").text());
                        var postData = { "orderNumber": orderNumber, "type": "orderCancel" };
                        //发送AJAX请求
                        sendAjaxUrl(dialog, postData, "/Verwalter/order/param/edit");
                        return false;
                    },
                    focus: true
                }, {
                    name: '关闭'
                }]
            });

        }
        //作废订单
        function OrderInvalid() {
            var dialog = $.dialog({
                title: '取消订单',
                content: '操作提示信息：<br />1、设为作废订单，将不可逆转；<br />2、会员用户，自动检测退还金额或粮草到账户；<br />3、请单击相应按钮继续下一步操作！',
                min: false,
                max: false,
                lock: true,
                icon: 'confirm.gif',
                button: [{
                    name: '检测退还',
                    callback: function () {
                        var order_no = $.trim($("#spanOrderNumber").text());
                        var postData = { "order_no": order_no, "edit_type": "order_invalid", "check_revert": 1 };
                        //发送AJAX请求
                        sendAjaxUrl(dialog, postData, "../../tools/Verwalter_ajax.ashx?action=edit_order_status");
                        return false;
                    },
                    focus: true
                }, {
                    name: '直接作废',
                    callback: function () {
                        var order_no = $.trim($("#spanOrderNumber").text());
                        var postData = { "order_no": order_no, "edit_type": "order_invalid", "check_revert": 0 };
                        //发送AJAX请求
                        sendAjaxUrl(dialog, postData, "../../tools/Verwalter_ajax.ashx?action=edit_order_status");
                        return false;
                    }
                }, {
                    name: '关闭'
                }]
            });
        }
        //打印订单
        function OrderPrint() {
            var dialog = $.dialog({
                title: '打印订单',
                content: 'url:/Verwalter/order/dialog/print?orderNumber=' + $.trim($("#spanOrderNumber").text()),
                min: false,
                max: false,
                lock: true,
                width: 850//,
                // height: 500
            });
        }
        //修改收货信息
        function EditAcceptInfo() {
            var dialog = $.dialog({
                title: '修改收货信息',
                content: 'url:/Verwalter/order/dialog/contact',
                min: false,
                max: false,
                lock: true,
                width: 550,
                height: 320
            });
        }
        //修改订单备注
        function EditOrderRemark() {
            var dialog = $.dialog({
                title: '订单备注',
                content: '<textarea id="orderRemark" name="txtOrderRemark" rows="2" cols="20" class="input"><#if order.remarkInfo??>${order.remarkInfo?chop_linebreak}</#if></textarea>',
                min: false,
                max: false,
                lock: true,
                ok: function () {
                    var remark = $("#orderRemark", parent.document).val();
                    if (remark == "") {
                        $.dialog.alert('对不起，请输入订单备注内容！', function () { }, dialog);
                        return false;
                    }
                    var orderNumber = $.trim($("#spanOrderNumber").text());
                    var postData = { "orderNumber": orderNumber, "type": "editMark", "data": remark };
                    //发送AJAX请求
                    sendAjaxUrl(dialog, postData, "/Verwalter/order/param/edit");
                    return false;
                },
                cancel: true
            });
        }
        // 修改总金额
        function EditRealAmount() {
            var pop = $.dialog.prompt2('请修改商品总金额', '备注',
            function (val, info) {
                if (!checkIsMoney(val)) {
                    $.dialog.alert('对不起，请输入正确的配送金额！', function () { }, pop);
                    return false;
                }
                
                if (undefined == info || "" == info){
                    $.dialog.alert('请输入备注信息！', function () { }, pop);
                    return false;
                }
                
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "editTotalGoodsPrice", "data": val, "info": info };
                //发送AJAX请求
                sendAjaxUrl(pop, postData, "/Verwalter/order/param/edit");
                return false;
            },
            $.trim($("#spanRealAmountValue").text())
        );
        }
        
        // 修改预付金额
        function Editprepay() {
            var pop = $.dialog.prompt2('请修改预付金额', '备注',
            function (val, info) {
                if (!checkIsMoney(val)) {
                    $.dialog.alert('对不起，请输入正确的配送金额！', function () { }, pop);
                    return false;
                }
                
                if (undefined == info || "" == info){
                    $.dialog.alert('请输入备注信息！', function () { }, pop);
                    return false;
                }
                
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "Editprepay", "data": val, "info": info };
                //发送AJAX请求
                sendAjaxUrl(pop, postData, "/Verwalter/order/param/edit");
                return false;
            },
            $.trim($("#spanprepay").text())
        );
        }
        
        // 修改尾款金额
        function EditfinalPayment() {
            var pop = $.dialog.prompt2('请修改尾款金额', '备注',
            function (val, info) {
                if (!checkIsMoney(val)) {
                    $.dialog.alert('对不起，请输入正确的配送金额！', function () { }, pop);
                    return false;
                }
                
                if (undefined == info || "" == info){
                    $.dialog.alert('请输入备注信息！', function () { }, pop);
                    return false;
                }
                
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "EditfinalPayment", "data": val, "info": info };
                //发送AJAX请求
                sendAjaxUrl(pop, postData, "/Verwalter/order/param/edit");
                return false;
            },
            $.trim($("#spanfinalPayment").text())
        );
        }
        
        
        //修改配送费用
        function EditExpressFee() {
            var pop = $.dialog.prompt2('请修改配送费用', '备注',
            function (val) {
                if (!checkIsMoney(val)) {
                    $.dialog.alert('对不起，请输入正确的配送金额！', function () { }, pop);
                    return false;
                }
                
                if (undefined == info || "" == info){
                    $.dialog.alert('请输入备注信息！', function () { }, pop);
                    return false;
                }
                
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "editDeliveryPrice", "data": val, "info": info };
                //发送AJAX请求
                sendAjaxUrl(pop, postData, "/Verwalter/order/param/edit");
                return false;
            },
            $.trim($("#spanExpressFeeValue").text())
        );
        }
        //修改手续费用
        function EditPaymentFee() {
            var pop = $.dialog.prompt2('请修改支付手续费用', '备注',
            function (val) {
                if (!checkIsMoney(val)) {
                    $.dialog.alert('对不起，请输入正确的手续费用！', function () { }, pop);
                    return false;
                }
                
                if (undefined == info || "" == info){
                    $.dialog.alert('请输入备注信息！', function () { }, pop);
                    return false;
                }
                
                var orderNumber = $.trim($("#spanOrderNumber").text());
                var postData = { "orderNumber": orderNumber, "type": "editPayPrice", "data": val, "info": info };
                //发送AJAX请求
                sendAjaxUrl(pop, postData, "/Verwalter/order/param/edit");
                return false;
            },
            $.trim($("#spanPaymentFeeValue").text())
        );
        }

        //=================================工具类的JS函数====================================
        //检查是否货币格式
        function checkIsMoney(val) {
            var regtxt = /^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
            if (!regtxt.test(val)) {
                return false;
            }
            return true;
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
<form name="form1" method="post" action="/Verwalter/order/save" id="form1">
    <!--导航栏-->
    <div class="location" style="position: fixed; top: 0px;">
        <a href="/Verwalter/order/list/${statusId!"0"}/0" class="back"><i></i><span>返回列表页</span></a>
        <a href="/Verwalter/center" class="home"><i></i><span>首页</span></a>
        <i class="arrow"></i>
        <a href="/Verwalter/order/list/${statusId!"0"}/0"><span>订单管理</span></a>
        <i class="arrow"></i><span>订单详细</span>
    </div>
    <div class="line10">
    </div>
    <!--/导航栏-->
    <!--内容-->
    <div class="content-tab-wrap">
        <div id="floatHead" class="content-tab" style="position: static; top: 52px;">
            <div class="content-tab-ul-wrap">
                <ul>
                    <li>
                        <a href="javascript:;" onclick="tabs(this);" class="selected">订单详细信息</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <dl>
            <dd style="margin-left: 50px; text-align: center;">
                <div class="order-flow" style="width: 850px">
                    <#if order.statusId == 1>
                        <div class="order-flow-left">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">订单已生成</p>
                                <p>${order.orderTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">待确认</p>
                            </span>
                        </div>
                        <div class="order-flow-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">待付款</p>
                            </span>
                        </div>
                        <div class="order-flow-right-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">未完成</p>
                                <p></p>
                            </span>
                        </div>
                    <#elseif order.statusId == 2>
                        <div class="order-flow-left">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">订单已生成</p>
                                <p>${order.orderTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">待付款</p>
                            </span>
                        </div>
                        <div class="order-flow-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">待发货</p>
                            </span>
                        </div>
                        <div class="order-flow-right-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">完成</p>
                                <p></p>
                            </span>
                        </div>
                    <#elseif order.statusId == 3>
                        <div class="order-flow-left">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">订单已生成</p>
                                <p>${order.orderTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-arrive">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">已付款</p>
                                <p>${order.payTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">待发货</p>
                            </span>
                        </div>
                        <div class="order-flow-right-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">完成</p>
                                <p></p>
                            </span>
                        </div>
                    <#elseif order.statusId == 4>
                        <div class="order-flow-left">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">订单已生成</p>
                                <p>${order.orderTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-arrive">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">已付款</p>
                                <p>${order.payTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-arrive">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">待发货</p>
                            </span>
                        </div>
                        <div class="order-flow-right-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">完成</p>
                                <p></p>
                            </span>
                        </div>
                    <#elseif order.statusId == 5>
                        <div class="order-flow-left">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">订单已生成</p>
                                <p>${order.orderTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-arrive">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">已付款</p>
                                <p>${order.payTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-arrive">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">待发货</p>
                                <p>${order.serviceTime!''}</p>
                            </span>
                        </div>
                        <div class="order-flow-right-wait">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">完成</p>
                            </span>
                        </div>
                    <#elseif order.statusId == 6>
                        <div class="order-flow-left">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">订单已生成</p>
                                <p>${order.orderTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-arrive">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">已付款</p>
                                <p>${order.payTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-arrive">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">待发货</p>
                                <p>${order.serviceTime!''}</p>
                            </span>
                        </div>
                        <div class="order-flow-right-arrive">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">已完成</p>
                                <p>${order.finishTime!''}</p>
                            </span>
                        </div>
                    <#elseif order.statusId == 7>
                        <div class="order-flow-left">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">订单已生成</p>
                                <p>${order.orderTime!""}</p>
                            </span>
                        </div>
                        <div class="order-flow-right-arrive">
                            <a class="order-flow-input"></a>
                            <span>
                                <p class="name">已取消</p>
                                <p>${order.cancelTime!''}</p>
                            </span>
                        </div>
                    </#if>
                </div>
            </dd>
        </dl>
        <dl>
            <dt>订单号</dt>
            <dd>
                <span id="spanOrderNumber">${order.orderNumber!""}</span>
            </dd>
        </dl>
        
        <dl>
            <dt>商品列表</dt>
            <dd>
                <table border="0" cellspacing="0" cellpadding="0" class="border-table" width="98%">
                    <thead>
                        <tr>
                            <th width="12%">
                                商品ID
                            </th>
                            <th>
                                商品名称
                            </th>
                            <th width="10%">
                                数量
                            </th>
                            <th width="12%">
                                数量合计
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <#if order.orderGoodsList??>
                            <#list order.orderGoodsList as goods>
                                <tr class="td_c">
                                    <td>${goods.goodsId!""}</td>
                                    <td style="text-align: left; white-space: normal;">
                                        ${goods.goodsTitle!""} 
                                    </td>
                                    <td>${goods.quantity!""}</td>
                                    <td></td>
                                </tr>
                            </#list>
                        </#if>
                         <tr class="td_c">
                                <td></td>
                                <td style="text-align: left; white-space: normal;">
                                </td>
                                <td></td>
                                <td>${order.totalNumber!'0'}</td>
                            </tr>
                    </tbody> 
                </table> 
            </dd> 
        </dl>
        
        <dl>
            <dt>订单信息</dt>
            <dd>
                <table border="0" cellspacing="0" cellpadding="0" class="border-table" width="98%">
                    <tbody>
                    <tr>
                        <th width="20%">
                            商品总量
                        </th>
                        <td>
                            <div class="position">
                                <span id="spanRealAmountValue">
                                    <#if order.totalNumber??>${order.totalNumber!'0'}</#if>
                                </span> (箱/瓶)
                            </div>
                        </td>
                    </tr>    
                    <tr>
                        <th width="20%">
                            姓名
                        </th>
                        <td>
                            <div class="position">
                                <span id="spanAcceptName">${order.shippingName!""}</span>
                            </div>
                        </td>
                    </tr>
                     <tr>
                        <th width="20%">
                            地址
                        </th>
                        <td>
                            <span>${order.shippingAddress!''}</span>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            电话
                        </th>
                        <td><span id="spanMobile">${order.shippingPhone!""}</span></td>
                    </tr>
                </tbody>
                </table>
            </dd>
        </dl>
        
                </tbody></table>
            </dd>
        </dl>
        
        <dl>
            <dt>备注</dt>
            <dd>
                
                <table border="0" cellspacing="0" cellpadding="0" class="border-table" width="98%">
                    <tbody>
                    
                    
                    <tr>
                        <th  width="20%">
                            用户留言
                        </th>
                        <td>${order.userRemarkInfo!""}</td>
                    </tr>
                    <tr>
                        <th valign="top">
                            订单备注
                        </th>
                        <td>
                            <div class="position">
                                <div>${order.remarkInfo!""}</div>
                                <input name="btnEditRemark" type="button" id="btnEditRemark" class="ibtn" value="修改" style="margin-top: -3px;">
                            </div>
                        </td>
                    </tr>
                </tbody></table>
            </dd>
        </dl>
        
    </div>
    <!--/内容-->
    <!--工具栏-->
    <div class="page-footer">
        <div class="btn-list">
            <#if order.statusId==1>
                <input type="button" id="btnConfirm" value="确认订单" class="btn">
                <input type="button" id="btnCancel" value="取消订单" class="btn green">
            <#elseif order.statusId==2>
                <input type="button" id="btnPayment" value="确认付款" class="btn">
            <#elseif order.statusId==3>
                <input type="button" id="btnPaymentLeft" value="确认已发货" class="btn">
            <#elseif order.statusId==4>
                <input type="button" id="btnService" value="确认用户收货" class="btn green">
            <#elseif order.statusId==5>
                <input type="button" id="btnOrderComplete" value="确认完成" class="btn">
            </#if>
            <#if order.statusId != 7>
                <input type="button" id= "btnPrint" value="打印订单" class="btn violet">
                <input type="button" id="btnCancel" value="强制取消" class="btn yellow">
            </#if>
            <input type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);">
        </div>
        <div class="clear">
        </div>
    </div>
    <!--/工具栏-->
    </form>


</body></html>

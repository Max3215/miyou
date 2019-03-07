/* ! jQuery.common?v1.0 2016-03-02 */
// writer shoko

$(document).ready(function(){
	//tab();                   // 选项卡
  listMove();                // 列表滑动
  //mileMove();              // 服务与产品选择里程数           
  //popUps();                // 弹窗
  // lookMore();
  // newslistHover();
  // reviewsBox("#reviewsbox","a","sel");//评价星星
});

/*// 返回顶部
function goTop(){
  $("html,body").animate({scrollTop:0},400);
};*/

/*// Tab选项卡
function tab(){
  // 首页筛选车
  $('#tab-ul-1').on('click','li',function(e){
    var $self = $(this);//当前a标签
    var $active = $self.closest('li');//当前点击li
    var index = $active.prevAll('li').length;//当前索引  

    $active.addClass('active').siblings('li').removeClass('active');
    $('#tab-ol-1').find('>li')[index==-1?'show':'hide']().eq(index).show();

    $(".filter .select .btn-qby").click(function(){
      $("#tab-ol-1 li").hide();
    });
    /*e.stopPropagation();  //阻止冒泡事件
    $(document).click(function(){
      $('#tab-ol-1').find('>li').hide();
    });
  });

  // 服务与产品详情-评论
  $('#tab-ul-2').on('click','a',function(){
    var $self = $(this);//当前a标签
    var $active = $self.closest('li');//当前点击li
    var index = $active.prevAll('li').length;//当前索引

    $active.addClass('active').siblings('li').removeClass('active');
    $('#tab-ol-2').find('>li')[index==-1?'show':'hide']().eq(index).show();
  });

  // 服务点-全部订单
  $('#tab-dl').on('click','dd',function(){
    var $self = $(this);//当前a标签
    var $active = $self.closest('dd');//当前点击li
    var index = $active.prevAll('dd').length;//当前索引

    $active.addClass('active').siblings('dd').removeClass('active');
    $('#tab-art').find('>section')[index==-1?'show':'hide']().eq(index).show();
  });

  // 服务点-全部订单
  $('#tab-dl').on('click','dd',function(){
    var $self = $(this);//当前a标签
    var $active = $self.closest('dd');//当前点击li
    var index = $active.prevAll('dd').length;//当前索引

    $active.addClass('active').siblings('dd').removeClass('active');
    $('.user .tab-art').find('>section')[index==-1?'show':'hide']().eq(index).show();
  });

  // 首页分类菜单
  $('.index-top-nav .top-nav .total-nav dl dd').on('mouseover',function(){
    var $self = $(this);//当前a标签
    var $active = $self.closest('dd');//当前点击li
    var index = $active.prevAll('dd').length;//当前索引

    // $active.addClass('active').siblings('li').removeClass('active');
    $('.index-top-nav .top-nav .total-nav .right-menu-box')[index==-1?'show':'hide']().eq(index).show();
  });
  $('.index-top-nav .top-nav .total-nav .right-menu-box').mouseleave(function(){
    $(this).hide();
  });*/

  /*// 首页产品楼层左侧列表
  $(".floor-one .content .left-ul li").mouseover(function(){
    $(this).addClass("active");
    $(this).siblings("li").removeClass("active");
  });*/


  /*// 新闻资讯浏览模式
  $('#tab-ul-3').on('click','a',function(){
    var $self = $(this);//当前a标签
    var $active = $self.closest('li');//当前点击li
    var index = $active.prevAll('li').length;//当前索引

    $active.addClass('active').siblings('li').removeClass('active');
    $('#tab-ol-3').find('>li')[index==-1?'show':'hide']().eq(index).show();
  });
};
*/

//列表滑动

/*// 首页保养服务
function listMove(){
  var i = 0;
  var moveL = 1085/7;
  var length = $("#index_news ol li").length;

  $("#index_next").click(function(){
    i++;
    if(i > length - 7){
      i = length -7;
    };
    var index = i * moveL;
    $("#index_news ol").animate({left:-index+"px"},500);               
  });
  $("#index_last").click(function(){
    i--;
    if(i < 0){
      i = 0;
    };        
    var index = i * moveL;
    $("#index_news ol").animate({left:-index+"px"},500);
  });

  // mouseover
  $("#index_news ol li").mouseover(function(){
    $(this).css("background","#1494ed");
    $(this).find("img.img2").show();
    $(this).find("img.img1").hide();
    $(this).find("a").css("color","#fff");
  });
  // mouseleave
  $("#index_news ol li").mouseleave(function(){
    $(this).css("background","none");
    $(this).find("img.img1").show();
    $(this).find("img.img2").hide();
    $(this).find("a").css("color","#666");
  }); 
};*/

// 服务与产品选择里程数
function mileMove(){
  var i = 0;
  var moveL = 700/7;
  var length = $("#fwycp-mile ol li").length;

  $("#fwycp_next").click(function(){
    i++;
    if(i > length - 7){
      i = length -7;
    };
    var index = i * moveL;
    $("#fwycp-mile ol").animate({left:-index+"px"},500);               
  });
  $("#fwycp_last").click(function(){
    i--;
    if(i < 0){
      i = 0;
    };        
    var index = i * moveL;
    $("#fwycp-mile ol").animate({left:-index+"px"},500);
  });
};

// 首页产中心
function listMove(){
  var i = 0;
  var moveL = 1200/4;
  var length = $("#pc-bottom ul li").length;

  $("#btn-next").click(function(){
    i++;
    if(i > length - 4){
      i = length -4;
    };
    var index = i * moveL;
    $("#pc-bottom ul").animate({left:-index+"px"},500);               
  });
  $("#btn-prev").click(function(){
    i--;
    if(i < 0){
      i = 0;
    };        
    var index = i * moveL;
    $("#pc-bottom ul").animate({left:-index+"px"},500);
  });
};

// 右侧带缩略图banner图
window.onload=function(){
  goTop();
  function goTop(){
    var god=1;
    var bigImg=document.getElementById('left-big-img').getElementsByTagName('img')[0];
    var smallBox=document.getElementById('smallBox');
    var btn_up=document.getElementById('btn-up');
    var btn_down=document.getElementById('btn-down');
    var small_ul=document.getElementById('small_ul');
    var oLi=small_ul.getElementsByTagName('li');
    var oImg=small_ul.getElementsByTagName('img');
    var num=0,onOff=false;
    var one=oLi[0].offsetHeight+8;
    for(i=0;i<oLi.length;i++){
      oLi[i].index=i;
      oLi[i].onclick=function(){
        for(i=0;i<oLi.length;i++){
          oLi[i].className='';
        }
        oLi[this.index].className='current';
        bigImg.src=oImg[this.index].src;
      }
    }
    btn_down.onclick=function(){
      if(onOff){return};
      num<oLi.length-3?num++:num=oLi.length-3;
      god<oLi.length-3?god++:god=oLi.length-2;
      go(small_ul,-1,10);
      fnn();
      // console.log(small_ul.offsetTop);
    }

    btn_up.onclick=function(){
      if(onOff){return};
      num>0?num--:num=0;
      god>1?god--:god=1;
      go(small_ul,1,10);
      fnn();
      // console.log(small_ul.offsetTop);
    }

    function fnn(){
      console.log(god);
      for(i=0;i<oLi.length;i++){
        oLi[i].className='';
      }
      oLi[god].className='current';
      bigImg.src=oImg[god].src;
    }

    function go(obj,code,yy){
      function run(){
        if(code<0 && obj.offsetTop>-num*one || code>0 && obj.offsetTop<-num*one){
          obj.style.top=obj.offsetTop+code*yy+'px';
          // console.log(obj.offsetTop+':'+(-num*one));
          setTimeout(run,30);
        }else{
          // console.log('eles'+obj.offsetTop+':'+(-num*one));
          obj.style.top=-num*one+'px';
        }
      }
      run();
    }
  }
};

/* 弹窗 */
function popUps(){

  // 服务与产品弹窗

  $(".fwycp .condition-select .sec1 a").click(function(){
    $(".fwycp-op1").show();
    $("#opacity20").show();
  });

  // 点击关闭
  $(".fwycp-op1 .top a").click(function(){
    $(".fwycp-op1").hide();
    $("#opacity20").hide();
  });

  //可选产品
  $(".fwycp-details .fwxm dl dd a.btn-change").click(function(){
    $("#opacity20").show();
    $(".fwycpxq-pup1").show();
  });

  // 选择服务点
  $("#select-fwd").click(function(){
    $("#opacity20").show();
    $(".fwycpxq-pup2").show();
  });

  // 服务点详情
  $(".fwycpxq-pup2 .lists ul li .div3 a.a2").click(function(){
    $("#opacity20").show();
    $(".fwycpxq-pup3").show();
  });

  // 用户-会员中心-编辑资料
  $(".user .fwd-pc .fwdxx .content .right div a.a1").click(function(){
    $("#opacity20").show();
    $(".user-pup1").show();
  });

  // 用户-会员中心-编辑头像
  $(".user .fwd-pc .fwdxx .content .left a").click(function(){
    $("#opacity20").show();
    $(".user-pup2").show();
  });

  // 用户-会员中心-修改密码
  $(".user .fwd-pc .fwdxx .content .right div a.a2").click(function(){
    $("#opacity20").show();
    $(".user-pup3").show();
  });

}
/* 弹窗 END */


/*// 查看更多
function lookMore(){
  // 商品列表查看更多
  var onOne = true;
  $(".goods-filter .top-filter a.look-more").click(function(){
    if(onOne){
      $(this).html("收起 ^");
      $(this).parent(".goods-filter .top-filter").css("height","auto");
      $(this).parent(".goods-filter .top-filter").css("paddingBottom","15px");
    }else{
      $(this).html("更多 V");
      $(this).parent(".goods-filter .top-filter").css("height","30px");
      $(this).parent(".goods-filter .top-filter").css("paddingBottom","0");
    };
    onOne = !onOne;
  });

  var onTwo =true;
  $(".goods-filter .filters .filter-one a.look-more").click(function(){
    if(onTwo){
      $(this).html("收起 ^");
      $(this).parent(".goods-filter .filters .filter-one").css("height","auto");
      $(this).parent(".goods-filter .filters .filter-one").css("paddingBottom","15px");
    }else{
      $(this).html("更多 V");
      $(this).parent(".goods-filter .filters .filter-one").css("height","30px");
      $(this).parent(".goods-filter .filters .filter-one").css("paddingBottom","0");
    };
    onTwo = !onTwo;
  });

  // 订单详情-商品出库 展开
  var onThree =true;
  $(".view-logistics .logistic-info .order-number div.wuliu a").click(function(){
    if(onThree){
      $(this).html("收起");
      $(this).addClass("pack-up");
      $(".view-logistics .logistic-info .order-number div.wuliu-lists").show();
    }else{
      $(this).html("展开");
      $(this).removeClass("pack-up");
      $(".view-logistics .logistic-info .order-number div.wuliu-lists").hide();
    };
    onThree = !onThree;
  });

};*/

/*// 新闻资讯列表模式
function newslistHover(){
  var $listOne = $("#tab-ol-3 .li-way-two .lists-one");

  // 鼠标经过
  $listOne.mouseover(function(){
      $(this).find(".div1").animate({marginTop:"30px"},500);
      $(this).find(".div2").hide();
      $(this).find(".div3").animate({bottom:"0"},500);
  });
  // 鼠标离开
  $listOne.mouseout(function(){
    $(this).find(".div1").stop(true,true).animate({marginTop:"70px"},500);
    $(this).find(".div2").show();
    $(this).find(".div3").stop(true,true).animate({bottom:"-110px"},500);
  });
};*/

/*//评价星星效果
function reviewsBox(boxid,_name,_hover){
  var _box = $(boxid);
  var _arr = _box.find(_name);
  var _index = 0;
  var _now = _box.find("."+_hover).length;
  
  var _checkNow = function(_num){
    _arr.removeClass(_hover);
      for(var i=0;i<=_num;i++){
        _arr.eq(i).addClass(_hover);
        }
    };//fun END
    
  // hover效果
  _arr.hover(function(){
    _index = $(this).index();
    _checkNow(_index);
    },function(){
      _checkNow(_now-1);
  });

  // 点击效果
  _arr.click(function(){
        _now = $(this).index();
        for(var i=0;i<=_now;i++){
        _arr.eq(i).addClass(_hover);
        }
      _now += 1;
    });
};*/



<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/micsunplatform.tld" prefix="mspf"%>
<%@ taglib uri="/WEB-INF/tlds/micsunui.tld" prefix="msui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<mspf:Data msgHandler="EcomShopMsgHdr" operation="p_shop_view" param="{shopCode:'${param.sc}'}" paramType="json"></mspf:Data>
<!doctype html>
<html class="no-js">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>APP下载</title>
		<meta name="description" content="">
		<meta name="keywords" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" href="css/amazeui.min.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/app.css">
		<script language='javascript'src='${portal_web_root}/js/common/velocity.js'></script>
		<script language='javascript'src='${portal_web_root}/js/common/common.js'></script>
		<script type="text/javascript" src="${portal_web_root}/js/jquery/jquery-1.7.1.js"></script>
		<script language='javascript'src='${portal_web_root}/js/common/micsun.plugin.velocity.js'></script>
		<style>
						p {
				margin: 0;
			}
			.download-menu {
				background-color: #DA222E;
				padding: 18px 8px 22px 8px;
				position: relative;
			}
			.cloud {
				position: absolute;
				left: 0;
				bottom: -4px;
				right: 0;

			}
			.cloud img {
				width: 100%;
			}
			.phone-img {
				width: 40%;
			}
			.phone-img img {
				width: 100%;
			}
			.download-btn {
				width: 60%;
				padding-left: 4%;
				padding-top: 12px;
			}
			.download-btn .btn {
				background-color:#F5F5F5;
				height: 3.4rem;
				width: 78%;
				border-radius: 4px;
			}
			.download-btn .shopname {
				color: #fff;
				font-size: 1.2rem;
				margin: 12px 0;
			}
			.download-btn .btn a {
				display: block;
				width: 100%;
				height: 100%;
			}
			.download-btn .btn span {
				float: left;
				height: 100%;
			}
			.download-btn .btn .icon {
			width: 30%;
			padding: 5px 0 0 11px;
		}
			.download-btn .btn .icon img {
			display: block;
			width: 68%;
		}
			.download-btn .btn .text {
				width: 70%;
				text-align: center;
				line-height: 3.4rem;
				border-left: 1px solid #E2E5EA;
				font-size: 1.4rem;
			}
			.logo .right {
				width: 75%;  padding-top:8px;
				padding-left: 6px;
				font-size: 1.5rem;
			}
			.logo .right p {
				color: #fff;
			}
			.logo .tree-logo {
				width: 25%;
			}
			.logo .tree-logo img {
				width: 100%;
			}
			.paragraphs {
				background-color: #fff;
				padding: 12px;
				font-size: 1.4rem;
			}
			.paragraphs .intro {
				  text-indent: 2em;
				  margin-bottom: 0;
			}
			.paragraphs .addr {
				margin: 0.4rem 0;
			}
			.paragraphs .contact {
				margin: 0;
			}
			.shop-pics {
				padding: 22px;
				background-color:#fff;
			}
			.shop-pics img {
				display: block;
				width: 100%;
			}
			.shop-pics .one {
				float: left;
				width: 47%;
				border-radius:8px;
				overflow: hidden;
				margin-bottom:10px;
			}
			.shop-pics .two {
				float: right;
				width: 47%;
				border-radius:8px;
				overflow: hidden;
				margin-bottom:10px;
			}
			.weixinTip {
				background-color: rgba(0,0,0,0.8);
				padding: 12px 0;
			}
			.weixinTip p {
				padding-left: 22px;
				color: #fff
			}
			</style>
		<script>
function androidDownload(){
	if(is_weixin()){
$("#weixinTip").show('slow');
return;
}
window.location.href="${portal_web_root}/uploadfiles/apk/android/happytree61.apk";
}

function CheckIsAndroid() {
    var browser = {
        versions: function () {
            var u = navigator.userAgent, app = navigator.appVersion;
            return { //移动终端浏览器版本信息 
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端 
                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器 
                iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器 
                iPad: u.indexOf('iPad') > -1, //是否iPad 
            };
        }(),
    }
    //if (browser.versions.iPhone || browser.versions.iPad || browser.versions.ios) {
    //    return false;
    //}
    if (browser.versions.android)
        return true;
    return false;
}

function CheckIsIOS() {
    var browser = {
        versions: function () {
            var u = navigator.userAgent, app = navigator.appVersion;
            return { //移动终端浏览器版本信息 
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端 
                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器 
                iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器 
                iPad: u.indexOf('iPad') > -1, //是否iPad 
            };
        }(),
    }
    if (browser.versions.iPhone || browser.versions.iPad || browser.versions.ios) 
        return true;

        return false;
    
}


    function is_weixin() {
        var ua = navigator.userAgent.toLowerCase();
        if (ua.match(/MicroMessenger/i) == "micromessenger") {
            return true;
        } else {
            return false;
        }
    }


		
		$(function(){ 

	    	  var param = {};
	    	  param.provinceId = ${ecomShop.province}; 
	    	  param.cityId = ${ecomShop.city};
	    	  param.regionId = ${ecomShop.region};
	    	  var msgHdr = new MsgHandler("${portal_web_root}","HrAreaMsgHdr","p_get_area_by_id", param, null, showArea,true);
			  msgHdr.sendMsg();
			  var resParams={};	
			  resParams.objectId = ${ecomShop.shopId};
			  resParams.objectType	="EcomShop";
			  var msgHdr1 = new MsgHandler("${portal_web_root}","PortalResourceMsgHdr","do_search_images", resParams, null, showImages,true);
			  msgHdr1.sendMsg();
			  var sc = htmldecode('${ecomShop.shopDesc}');
			  
			  $("#info").html(sc);
			  
	      }); 

		function showArea(result){
	    	$("#province").text(result.object.areaName);
	      } 
		function showImages(result){
			var n = result.object.count;
			var data = result.object.data
		   for(var i=1;i<=n;i++){
			   $("#images").append("<div class='"+(i==1?'one':(i==2?'two':(i==3?'one':(i==4?'two':''))))+"'>"+
				"<img src='${ctx}"+result.object.data[i-1].resUrl+"'></div>");
		   }
		}
		
		function htmlencode(s){  
		    var div = document.createElement('div');  
		    div.appendChild(document.createTextNode(s));  
		    return div.innerHTML;  
		}  
		function htmldecode(s){  
		    var div = document.createElement('div');  
		    div.innerHTML = s;  
		    return div.innerText || div.textContent;  
		}  
		</script>
	</head>
	<body>
		<div class="weixinTip" id="weixinTip" style="display:none">
		<p>1. 点击右上角，选择"在浏览器中打开"</p>
		<p>2. 在打开的浏览器中点击下载按钮</p>
		</div>
		<div class="download-menu am-cf">
			<div class="am-fl phone-img">
				<img src="img/phone.jpg" alt="">
			</div>
			<div class="am-fr download-btn">
				<div class="logo am-cf">
					<div class="tree-logo am-fl"><img src="img/tree_logo.png"></div>
					<div class="am-fl right">
						<p style="font-size:1.4rem">${ecomShop.shopName}</p>
						<p style="font-size:1rem">TCL幸福树直销商城</p>
						
					</div>
				</div>
				<p class="shopname">注册时请输入：${ecomShop.shopInviteCode}</p>
				<div class="btn" id="android_btn">
					<a href="javascript:androidDownload();">
					
						<span class="icon"><img src="img/android_icon.jpg" width="20"></span>
						<span class="text">Android下载</span>
					</a>
				</div>
				<div class="btn" id="ios_btn">
					<a href="http://fir.im/jp5z">
						<span class="icon"><img src="img/iphone.png"></span>
						<span class="text">Iphone下载</span>
					</a>
				</div>
			</div>
			<div class="cloud"><img src="img/cloud.png"></div>
		</div>
		<div class="paragraphs">
			<p class="intro" id="info"></p>
			<p class="addr am-cf">
				<span class="am-fl" style="width:17%">地&nbsp;&nbsp;址：</span>
				<span class="am-fr" style="width:83%"><span id="province"></span>${ecomShop.contactCompany}</span>
			</p>
			<p class="contact">
				<span class="">联系人：</span>
				<span class="">${ecomShop.contactPerson}</span>
				<span class="" style="margin-left:12px">${ecomShop.contactPhone}</span>
			</p>
		</div>
		<div class="shop-pics">
			<div class="one"></div>
			<div class="two"></div>
			<div class="three"></div>
			<div class="four"></div>
			<div class="five"></div>
			<div class="six"></div>
			<div id="images"></div>
		</div>
		<div class="shop-pics am-cf">

			<div id="images"></div>
			
	
		</div> 
		<script src="js/jquery.min.js"></script>
		<script src="js/amazeui.min.js"></script>


	</body>
</html>
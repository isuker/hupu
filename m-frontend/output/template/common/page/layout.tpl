<!DOCTYPE html>
{%html framework="common:static/mod.js" class="expanded"%}
{%head%}
<meta charset="utf-8"/>
<title>{%block name="title"%}{%$pageheader.title|f_escape_xml%}{%/block%}</title>
<link rel="dns-prefetch" href="//b1.hoopchina.com.cn" />
<link rel="dns-prefetch" href="//b2.hoopchina.com.cn" />
<link rel="dns-prefetch" href="//b3.hoopchina.com.cn" />
<meta id="viewport" name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
{%setMetaAppId appid="906632439"%}
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
{%block name="metaseo"%}
{%if empty($keywords)%}
{%$keywords = $pageheader.title%}
{%/if%}
{%if empty($description)%}
{%$description = $pageheader.title%}
{%/if%}
<meta name="keywords" content="{%$keywords|f_escape_xml%}" />
<meta name="description" content="{%$description|f_escape_xml%}" />
{%/block%}
<link rel="apple-touch-icon" href="//b2.hoopchina.com.cn/touch/static/common/images/app-icon-380x380_50a7ce0.png"/>
{%require name="common:static/common.scss"%}
{%require name="common:static/js/zepto/zepto.min.js"%}
{%require name="common:static/js/underscore/underscore.js"%}
{%require name="common:static/init.js"%}
{%require name="common:static/js/global/global.js"%}
{%script%}
             var login = require("common:widget/ui/login/login.js");
             HPM.popLogin = function(){
                login("{%$loginurl|f_escape_js%}");
             }
        {%/script%}
{%***不支持js的页面，发送dace请求****%}
{%dace fid=$dacebbsfid|default:"" channel=$daceChannel|default:"" daceid=$id4dace|default:""%}
<script>
            {%if isset($daceChannel) %}
                var __daceDataNameOfChannel = '{%$daceChannel|f_escape_js%}';
                {%if isset($dacebbsfid) %}
                var __daceDataNameOfForum = '{%$dacebbsfid|f_escape_js%}';
                {%/if%}
            {%/if%}
            var __daceDataNameOfPage = '{%$id4dace|f_escape_js%}';
            //dace源码无法区别网站协议，在外层添加以支持https, @2016/06/01 by meiandai
            window.currentSchema = /^https/i.test(location.href) ? "https://" : "http://";

            !function(win){
                var win = window;
                var HPM = win.HPM = {};
                // 用户id
                HPM.getUserId = "{%$uid|f_escape_js%}";
                // 用户名称
                HPM.getUserName = "{%$username|f_escape_js%}";
                // 用户登陆状态
                HPM.isLogin = {%intval($_islogin)%};
                HPM.loginUrl = '{%$loginurl|f_escape_js%}';
            }(window);

        // 百度的新统计
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "//hm.baidu.com/hm.js?abb0c7fb3fb595c51dc99849b10830bd";
          var s = document.getElementsByTagName("script")[0];
          s.parentNode.insertBefore(hm, s);
        })();
        </script>
<script src="//b3.hoopchina.com.cn/web/module/dace/m/m_dace.js"></script>
{%*****百度广告分享bug，暂时在微信和贴吧中去除百度广告*****%}
{%if $smarty.server.HTTP_USER_AGENT|strpos:'MicroMessenger' == false && $smarty.server.HTTP_USER_AGENT|strpos:'tieba' == false%}
<script src="//dup.baidustatic.com/js/dm.js"></script>
{%/if%}
{%block name="block_head_static"%}{%/block%}
<div style="width:0px; height:0px; overflow:hidden"><img src="//b1.hoopchina.com.cn/common/app-icon-380x380.png" /></div>
{%/head%}
{%body class="{%if !empty($kanqiu.night)%}night{%/if%}"%}
{%block name="content"%}{%/block%}
{%block name="footer"%}
{%widget name="common:widget/footer/footer.tpl"%}
{%/block%}
{%if !empty($goto_script)%}
{%$goto_script|escape:none%}
{%/if%}
{%require name='common:page/layout.tpl'%}{%/body%}
{%/html%}
